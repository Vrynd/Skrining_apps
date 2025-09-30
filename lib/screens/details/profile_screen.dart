import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/components/widget/scaffold_widget.dart';
import 'package:skrining_apps/provider/firebase_auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditMode = false; // sementara

  @override
  void initState() {
    super.initState();
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();

    Future.microtask(() async {
      await firebaseAuthProvider.getUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FirebaseAuthProvider>();
    final profile = provider.profile;
    final isLoading = provider.isLoading;

    return ScaffoldWigdet(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 20,
                ),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 24,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Profile Saya',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      // biar rata tengah
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(
                            profile?.photoUrl ??
                                'https://www.w3schools.com/w3images/avatar2.png',
                          ),
                        ),
                        if (isEditMode)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              child: const Icon(
                                Icons.camera_alt,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (profile != null) ...[
                    _buildProfileField(title: "Nama", value: profile.fullname),
                    _buildProfileField(title: "Email", value: profile.email),
                    _buildProfileField(
                      title: "Tanggal Lahir",
                      value: profile.birthDate != null
                          ? DateFormat(
                              'dd MMMM yyyy',
                            ).format(profile.birthDate!)
                          : null,
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  Widget _buildProfileField({required String title, String? value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value ?? '-',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
