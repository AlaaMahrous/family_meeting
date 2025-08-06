import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

String generateUserToken(String userId) {
  const secret = 'YOUR_STREAM_SECRET_KEY';
  final jwt = JWT({
    'user_id': userId,
    'exp': (DateTime.now().millisecondsSinceEpoch ~/ 1000) + 3600,
  });

  return jwt.sign(SecretKey(secret));
}
