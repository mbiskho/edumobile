class FAQ {
  String question;
  String answer;
  bool isExpanded;

  FAQ({
    required this.question,
    required this.answer,
    required this.isExpanded,
  });
}

List<FAQ> itemFaq = [
  FAQ(
    question: 'What Is Eduspace ?',
    answer:
        'Eduspace is a learning website aimed the general public. In accorndance with purpose of Eduspace itself, "Education for everyone". This website similar to Edx and Coursera with Kahoot. The difference was the others website was limited to some user. in the Eduspace all user available to access',
    isExpanded: false,
  ),
  FAQ(
    question: 'How is the system ?',
    answer: 'Same like others',
    isExpanded: false,
  ),
];
