import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:textly/src/common/widgets/repostiory_scope.dart';
import 'package:textly/src/feature/auth/bloc/auth_bloc.dart';
import 'package:textly/src/feature/auth/model/user_model.dart';
import 'package:textly/src/feature/auth/widget/auth_scope.dart';
import 'package:textly/src/feature/home/widget/default_home_screen_widget.dart';
import 'package:textly/src/feature/profile/bloc/bloc/profile_bloc.dart';
import 'package:textly_core/textly_core.dart';
import 'package:textly_ui/textly_ui.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.userId,
  });
  final int? userId;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileBloc bloc;
  @override
  void initState() {
    bloc = ProfileBloc(
      profileRepository: RepositoryScope.of(context).profileRepository,
    );

    final user = context.read<AuthenticationBLoC>().state.user;

    if (user.isAuthenticatedWithProfile && widget.userId == null) {
      bloc.add(
        ProfileEvent.initial(
          userId: user.userId!,
        ),
      );
    } else if (widget.userId != null) {
      bloc.add(
        ProfileEvent.initial(
          userId: widget.userId!,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticatedWithProfile = context
        .watch<AuthenticationBLoC>()
        .state
        .user
        .isAuthenticatedWithProfile;

    return SmartCorner(
      child: SwitchWidget(
        condition: widget.userId == null,
        trueParent: (context, child) {
          if (!isAuthenticatedWithProfile) {
            return const TextlyScaffold(body: Text('UnAuth'));
          }
          return TextlyScaffold(
            appBar: TextlyAppBar(
              centerAppBar: AppBar(
                title: const Text('Profile'),
              ),
            ),
            body: child!,
          );
        },
        falseParent: (context, child) =>
            DefaultHomeScreen(title: 'Profiles', child: child!),
        child: BlocProvider.value(
          value: bloc,
          child: BlocBuilder<ProfileBloc, ProfileState>(
            bloc: bloc,
            builder: (context, state) => state.map(
              loading: (state) => const Text('загрузка'),
              error: (state) => const Text('Ошибка'),
              success: (state) => DefaultTabController(
                length: 2,
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: Container(
                        height: 10,
                      ),
                    ),
                    SliverToBoxAdapter(
                      // child: SmartCorner(
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        color: Colors.white,
                        child: _LoadedProfileInfo(state.profile),
                      ),
                      // ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 10,
                      ),
                    ),
                    const SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(0),
                        child: ProfileTabBar(),
                      ),
                    ),
                  ],
                  body: const TabBarView(
                    children: <Widget>[
                      ShimmerPostPage(),
                      ShimmerPostPage(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(
        top: 2,
        bottom: 12,
        left: 16,
        right: 16,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          color: Colors.grey[200],
        ),
        child: TabBar(
          overlayColor:
              const MaterialStatePropertyAll(Color.fromARGB(0, 22, 22, 255)),
          onTap: (value) {},
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16,
            ),
            color: Colors.black,
          ),
          tabs: const [
            Tab(
              text: 'Посты',
            ),
            Tab(
              text: 'Ответы',
            )
          ],
        ),
      ),
    );
  }
}

class _LoadedProfileInfo extends StatelessWidget {
  const _LoadedProfileInfo(this.profile);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(int.parse('0x35${profile.backgroundColor}')),
              ),
              padding: const EdgeInsets.all(16),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  profile.avatar,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text('${profile.following}'),
                        const Text('Подписки'),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text('${profile.followers}'),
                        const Text('Подписчики'),
                      ],
                    ),
                  ],
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Действие'))),
              ],
            ),
          ],
        ),
        Container(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(profile.profileName),
            Text('@${profile.username}'),
            Text(
              profile.description ?? '',
              maxLines: 5,
            ),
          ],
        )
      ],
    );
  }
}

class ShimmerPostPage extends StatelessWidget {
  const ShimmerPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
          ShimmerPostWidget(countStrings: 2),
          SizedBox(
            height: 10,
          ),
          ShimmerPostWidget(countStrings: 1),
          SizedBox(
            height: 10,
          ),
          ShimmerPostWidget(countStrings: 3),
          SizedBox(
            height: 10,
          ),
          ShimmerPostWidget(countStrings: 1),
          SizedBox(
            height: 10,
          ),
          ShimmerPostWidget(countStrings: 2),
        ],
      ),
    );
  }
}

class ShimmerPostWidget extends StatelessWidget {
  const ShimmerPostWidget({
    required this.countStrings,
    super.key,
  });

  final int countStrings;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(18),
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(235, 230, 230, 230),
        highlightColor: const Color.fromARGB(255, 216, 216, 216),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 21,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 13,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 6),
            Container(
              height: 16,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            if (countStrings >= 2) const SizedBox(height: 5),
            if (countStrings >= 2)
              Container(
                height: 16,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            if (countStrings >= 3) const SizedBox(height: 5),
            if (countStrings >= 3)
              Container(
                height: 16,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 64,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 32,
                  width: 64,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 32,
                  width: 64,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
