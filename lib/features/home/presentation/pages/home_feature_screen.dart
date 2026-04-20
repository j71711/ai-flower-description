import 'package:ai/features/home/presentation/cubit/home_cubit.dart';
import 'package:ai/features/home/presentation/cubit/home_state.dart';
import 'package:ai/features/home/presentation/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/sunflower.jpeg',
      'assets/images/daisy.jpeg',
      'assets/images/cactuses.jpeg',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7E4E4),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final selectedIndex = state.selectedIndex;
            final selectedImage = images[selectedIndex];

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4B9BE),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .1),
                        blurRadius: 30,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: state is HomeLoadingState
                            ? null
                            : () {
                                context.read<HomeCubit>().getHomeMethod(
                                  selectedImage,
                                );
                              },
                        child: Container(
                          height: 230,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              selectedImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          images.length,
                          (index) => GestureDetector(
                            onTap: () {
                              context.read<HomeCubit>().changeImage(index);
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                                border: selectedIndex == index
                                    ? Border.all(color: Colors.white, width: 2)
                                    : null,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFDECEC),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Image Caption",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Tap image to generate AI caption",
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 20),

                              if (state is HomeLoadingState)
                                const Center(
                                  child: CircularProgressIndicator(),
                                ),

                              if (state is HomeInitialState)
                                homeWidgetCard(
                                  "Choose an image and tap to generate",
                                ),

                              if (state is HomeSuccessState)
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: homeWidgetCard(state.result.caption),
                                  ),
                                ),

                              if (state is HomeErrorState)
                                homeWidgetCard(state.message, isError: true),

                              
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
