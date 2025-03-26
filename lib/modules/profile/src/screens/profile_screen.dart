import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perpus/modules/profile/src/blocs/profile_bloc.dart';
import 'package:flutter_perpus/modules/profile/src/blocs/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  static final routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileSuccess) {
            final profile = state.profile;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                          'https://source.unsplash.com/random/200x200',
                        ),
                      ),
                      Text(
                        '${profile.namaDepan} ${profile.namaBelakang}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(profile.email),
                      Text('Lahir: ${profile.tanggalLahir}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate ke halaman edit profile
                        },
                        child: const Text('Edit Profile'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Tambahkan event Logout
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is ProfileFailure) {
            return Center(child: Text('Gagal memuat data: ${state.message}'));
          }

          return const Center(child: Text('Tidak ada data profil.'));
        },
      ),
    );
  }
}
