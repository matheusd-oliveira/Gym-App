import 'package:gym_app/shared/models/user_abstract.dart';
import 'package:gym_app/shared/models/user_client.dart';

class UserTrainer extends AbstractUser {
  // Lista de ids dos clientes (API)
  List<int> clientIds;

  // Lista dos clientes
  List<UserClient> listClients;
}
