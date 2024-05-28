import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HorizontalListview<T> extends StatefulWidget {
  final List<T> items;
  final String title;
  final VoidCallback loadNextPage;
  final String userId;

  const HorizontalListview({
    super.key,
    required this.userId,
    required this.items,
    required this.title,
    required this.loadNextPage,
  });

  @override
  State<HorizontalListview> createState() => _HorizontalListviewState();
}

class _HorizontalListviewState extends State<HorizontalListview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          _Title(title: widget.title),
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            itemCount: widget.items.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInRight(
                  child: _Slide(
                item: widget.items[index],
                userId: widget.userId,
              ));
            },
          ))
        ],
      ),
    );
  }
}

class _Slide<T> extends StatelessWidget {
  final T item;
  final String userId;

  const _Slide({required this.item, required this.userId});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                '',
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  }
                  return GestureDetector(
                    onTap: () => context.push('/home/$userId/pokemon/0'),
                    child: FadeIn(child: child),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 5),

          //* Title
          SizedBox(
            width: 150,
            child: Text(
              '',
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;

  const _Title({this.title});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
        ],
      ),
    );
  }
}
