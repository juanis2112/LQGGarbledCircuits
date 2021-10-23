#include "Actuator.h"
#include "Cloud.h"
#include "emp-tool/execution/circuit_execution.h"
#include "subsystem.h"

void print_init(Cloud *cloud, subSystem *subsystem, int k) {
  cout << "u" << 0 << ":  " << endl;
  for (int i = 0; i < cloud->sizeuk[0]; i++) {
    for (int j = 0; j < cloud->sizeuk[1]; j++) {
      cout << fixed << setprecision(5) << cloud->uk[i][j].reveal<double>(ALICE)
           << ", ";
    } 
    cout << endl;
  }
  cout << endl << endl;
  cout << "z" << k << ":  " << endl;
  for (int i = 0; i < subsystem->sizexk[0]; i++) {
    for (int j = 0; j < subsystem->sizexk[1]; j++) {
      cout << subsystem->zk[i][j].reveal<double>(ALICE) << ", " <<subsystem->zk_ne[i][j] << ", ";
    }
    cout << endl;
  }
  cout << endl << endl;

  cout << "s" << k << ":  " << endl;
  for (int i = 0; i < cloud->sizeCusum[0]; i++) {
    for (int j = 0; j < cloud->sizeCusum[1]; j++) {
      cout << cloud->Cusum[i][j].reveal<double>(ALICE) << ", ";
    }
    cout << endl;
  }
  cout << endl << endl;
}

void print_rest(Cloud *cloud, subSystem *subsystem, int k) {
  cout << endl << endl;
  cout << "u" << k << ":  " << endl;
  for (int i = 0; i < cloud->sizeuk[0]; i++) {
    for (int j = 0; j < cloud->sizeuk[1]; j++) {
      cout << cloud->uk[i][j].reveal<double>(ALICE) << ", ";
    }
    cout << endl;
  }
  cout << endl << endl;
  cout << "z" << k << ":  " << endl;
  for (int i = 0; i < subsystem->sizezk[0]; i++) {
    for (int j = 0; j < subsystem->sizezk[1]; j++) {
      cout << subsystem->zk[i][j].reveal<double>(ALICE) << ", " << subsystem->zk_ne[i][j] << ", ";
    }
    cout << endl;
  }
  cout << endl << endl;
  cout << "s" << k << ":  " << endl;
  for (int i = 0; i < cloud->sizeCusum[0]; i++) {
    for (int j = 0; j < cloud->sizeCusum[1]; j++) {
      cout << cloud->Cusum[i][j].reveal<double>(ALICE) << ", ";
    }
    cout << endl;
  }
  cout << endl << endl;
}

int main(int argc, char **argv) {
  int port, party;
  parse_party_and_port(argv, &party, &port);
  NetIO *io = new NetIO(party == ALICE ? nullptr : "127.0.0.1", port);
  setup_semi_honest(io, party);
  bool print = 1;
 
  fixedPoint aux;
  fixedPoint aux2;
  fixedPoint aux3;
  aux = fixedPoint(-5.309/100000000000, 24, 24, ALICE);
  aux2 = fixedPoint(10, 24, 24, ALICE);
  aux3 = aux.absolute_value();
  for (int i = 0; i<48; i++)
  {
    //cout<< aux3.bits[i].reveal(ALICE)<< endl;
  }
  cout<< aux.reveal<double>(ALICE)<< endl;

  subSystem *subsystem = new subSystem();
  // Setup *setup = new Setup();
  Cloud *cloud = new Cloud();

  // client offline
  // subsystem->inputData();

  // setup offline
  subsystem->inputData();

  subsystem->computeControlConstants();
  subsystem->garbleControlConstants();

  subsystem->computeReferenceConstants();
  subsystem->garbleReferenceConstants();

  // cloud offline
  cloud->getInputs(subsystem->L, subsystem->sizeL, subsystem->K, subsystem->sizeK,
                   subsystem->gamma1, subsystem->sizegamma1, subsystem->xgamma, subsystem->sizexgamma,
                   subsystem->uTilder, subsystem->sizeuTilder,
                   subsystem->Nu, subsystem->sizeNu, subsystem->Tau,
                   subsystem->sizeTau, subsystem->Cusum, subsystem->sizeCusum,
                   subsystem->A_BK, subsystem->sizeA_BK, subsystem->Bug, subsystem->sizeBug, //maybe changed
                   subsystem->xr, subsystem->sizexr, subsystem->ur,
                   subsystem->sizeur, subsystem->x0, subsystem->sizex0);

  // cloud->computeConstants();

  

  int k = 0;

  /*
  cout << "z" << k << ":  " << endl;
  for (int i = 0; i < subsystem->sizexk[0]; i++) {
    for (int j = 0; j < subsystem->sizexk[1]; j++) {
      cout << subsystem->xk[i][j].reveal<double>(BOB) << ", ";
    }
    cout << endl;
  }
  */

  //cloud->computeuk();
 
  //subsystem->measureState(cloud->uk);
  //subsystem->computezk();

  if (print) {
    print_init(cloud, subsystem, k);
  }

  cout << endl;
  for (k = 0; k < 2; k++) {

    if (k > 0){
      cloud->predict();
      cloud->computexHat(subsystem->zk);
    }
    cloud->computeResidues(subsystem->zk);
    cloud->computeuk();
    cloud->computeCusum();

    subsystem->measureState(cloud->uk);
    subsystem->computezk();

    if (print) {
      print_rest(cloud, subsystem, k+1);
    }
  }

  delete io;
  return 0;
}
