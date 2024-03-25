// import 'dart:collection';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fmp4/models/onboarding.dart';
// import 'package:fmp4/models/onboarding_item.dart';
// import 'package:test/test.dart';

// void main() {
//   test(
//     "Тест \"Изображение и текста из очереди извлекается правильно (в порядке добавления в очередь)\"",
//     () {
//       Queue<Item> _queue = Queue();
//       _queue
//           .add(Item("assets/onboarding/onboard1.svg", "Title 1", "Subtitle 1"));
//       _queue
//           .add(Item("assets/onboarding/onboard2.svg", "Title 2", "Subtitle 2"));
//       _queue
//           .add(Item("assets/onboarding/onboard3.svg", "Title 3", "Subtitle 3"));
//       _queue
//           .add(Item("assets/onboarding/onboard4.svg", "Title 4", "Subtitle 4"));

//       OB ob = OB(_queue);

//       expect(ob.getImage().toString(),
//           SvgPicture.asset("assets/onboarding/onboard1.svg").toString());
//       expect(ob.getTitle(), "Title 1");
//       expect(ob.getSubtitle(), "Subtitle 1");

//       ob.next();

//       expect(ob.getImage().toString(),
//           SvgPicture.asset("assets/onboarding/onboard2.svg").toString());
//       expect(ob.getTitle(), "Title 2");
//       expect(ob.getSubtitle(), "Subtitle 2");

//       ob.next();

//       expect(ob.getImage().toString(),
//           SvgPicture.asset("assets/onboarding/onboard3.svg").toString());
//       expect(ob.getTitle(), "Title 3");
//       expect(ob.getSubtitle(), "Subtitle 3");

//       ob.next();

//       expect(ob.getImage().toString(),
//           SvgPicture.asset("assets/onboarding/onboard4.svg").toString());
//       expect(ob.getTitle(), "Title 4");
//       expect(ob.getSubtitle(), "Subtitle 4");
//     },
//   );

//   test(
//     "Тест \"Корректное извлечение элементов из очереди (количество элементов в очереди уменьшается на единицу)\"",
//     () {
//       Queue<Item> _queue = Queue();
//       _queue
//           .add(Item("assets/onboarding/onboard1.svg", "Title 1", "Subtitle 1"));
//       _queue
//           .add(Item("assets/onboarding/onboard2.svg", "Title 2", "Subtitle 2"));
//       _queue
//           .add(Item("assets/onboarding/onboard3.svg", "Title 3", "Subtitle 3"));
//       _queue
//           .add(Item("assets/onboarding/onboard4.svg", "Title 4", "Subtitle 4"));

//       OB ob = OB(_queue);

//       ob.next();
//       expect(ob.getLength(), 3);

//       ob.next();
//       expect(ob.getLength(), 2);

//       ob.next();
//       expect(ob.getLength(), 1);

//       ob.next();
//       expect(ob.getLength(), 0);
//     },
//   );

//   test(
//     "Тест \"В случае, когда в очереди несколько картинок, устанавливается правильная надпись на кнопке\"",
//     () {
//       Queue<Item> _queue = Queue();
//       _queue
//           .add(Item("assets/onboarding/onboard1.svg", "Title 1", "Subtitle 1"));
//       _queue
//           .add(Item("assets/onboarding/onboard2.svg", "Title 2", "Subtitle 2"));
//       _queue
//           .add(Item("assets/onboarding/onboard3.svg", "Title 3", "Subtitle 3"));
//       _queue
//           .add(Item("assets/onboarding/onboard4.svg", "Title 4", "Subtitle 4"));

//       OB ob = OB(_queue);

//       expect(ob.isLast(), false);

//       ob.next();
//       expect(ob.isLast(), false);

//       ob.next();
//       expect(ob.isLast(), false);

//       ob.next();
//       expect(ob.isLast(), true);
//     },
//   );

//   test(
//     "Тест \"Случай, когда очередь пустая, надпись на кнопке должна измениться на \"Sing Up\"",
//     () {
//       Queue<Item> _queue = Queue();

//       OB ob = OB(_queue);

//       expect(ob.isEmpty(), true);
//     },
//   );
// }
