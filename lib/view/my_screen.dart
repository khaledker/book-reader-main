import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meduim_challenge/models/mymodel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:meduim_challenge/provider/my_provider.dart';

class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Accessing the state from the provider
    final myState = ref.watch(myNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBooks App'),
      ),
      body: myState.isLoading!
          ? const Center(
              child: CircularProgressIndicator()) // Loading Indicator
          : !myState.isConnected!
              ? Center(
                  child: Text(
                      'No Internet Connection')) // No Internet Connection Message
              : myState.myModelList.isEmpty
                  ? Center(child: Text('No data available')) // No Data Message
                  : ListView.builder(
                      itemCount: myState.myModelList.length,
                      itemBuilder: (context, index) {
                        final item = myState.myModelList[index];
                        return ListTile(
                          onTap: () => Navigator.of(context).pushNamed(
                            DetailsScreen.routeName,
                            arguments: item,
                          ),
                          title: Text(item.volumeInfo.title),
                          subtitle: Text(item.kind),
                        );
                      },
                    ), // List of Items
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final MyModel myModel =
        ModalRoute.of(context)!.settings.arguments as MyModel;
    ;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details Screen'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                myModel.volumeInfo.imageLinks?.thumbnail ?? '',
                height: 400,
                width: 500,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(myModel.volumeInfo.title),
              const SizedBox(
                height: 20,
              ),
              Text(myModel.kind),
              const SizedBox(
                height: 20,
              ),
              Text(myModel.volumeInfo.description ?? 'No description'),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        launchUrl(Uri.parse(myModel.volumeInfo.imageLinks!
                            .accessInfo!.webReaderLink!));
                      },
                      child: const Text("Read"))),
            ],
          ),
        ));
  }
}
