import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_projects/provider/example_8_voting_provider.dart';

import 'example_8_result_screen.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final votingProvider = Provider.of<VotingProvider>(context);
    return Scaffold(
      // backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Vote for Candidate'),
        // backgroundColor: Colors.blue[100],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: votingProvider.candidates.length,
                itemBuilder: (context, index){
                  final candidate = votingProvider.candidates[index];
                  final isVote = votingProvider.selectedCandidateId == candidate.id;

                  return ListTile(
                    title: Text(candidate.name),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isVote ? Colors.green : Colors.white
                      ),
                        onPressed: (){
                          votingProvider.vote(candidate.id);
                        },
                        child: Text(
                          "Vote",
                          style: TextStyle(
                              color: isVote ? Colors.white : Colors.black
                          ),
                        )
                    ),
                  );
                }),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>ResultScreen(),),
                );
              },
              child: Text("View Result"),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
