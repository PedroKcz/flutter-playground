import 'package:hello_world/quiz/model/question.dart';
import 'package:injectable/injectable.dart';

@singleton
class QuizRepository {

  List<Question> getQuestions() {
    return [
      Question(
        title: 'What are the main building blocks of Flutter UIs?',
        answers: [
          'Widgets',
          'Components',
          'Blocks',
          'Functions',
        ],
        correctAnswer: 'Widgets',
      ),
      Question(
        title: 'How are Flutter UIs built?',
        answers: [
          'By combining widgets in code',
          'By combining widgets in a visual editor',
          'By defining widgets in config files',
          'By using XCode for iOS and Android Studio for Android',
        ],
        correctAnswer: 'By combining widgets in code',
      ),
      Question(
        title: 'What\'s the purpose of a StatefulWidget?',
        answers: [
          'Update UI as data changes',
          'Update data as UI changes',
          'Ignore data changes',
          'Render UI that does not depend on data',
        ],
        correctAnswer: 'Update UI as data changes',
      ),
      Question(
        title:
            'Which widget should you try to use more often: StatelessWidget' +
                ' or StatefulWidget?',
        answers: [
          'StatelessWidget',
          'StatefulWidget',
          'Both are equally good',
          'None of the above',
        ],
        correctAnswer: 'StatelessWidget',
      ),
      Question(
        title: 'What happens if you change data in a StatelessWidget?',
        answers: [
          'The UI is not updated',
          'The UI is updated',
          'The closest StatefulWidget is updated',
          'Any nested StatefulWidgets are updated',
        ],
        correctAnswer: 'The UI is not updated',
      ),
      Question(
        title: 'How should you update data inside of StatefulWidgets?',
        answers: [
          'By calling setState()',
          'By calling updateData()',
          'By calling updateUI()',
          'By calling updateState()',
        ],
        correctAnswer: 'By calling setState()',
      ),
    ];
  }
}
