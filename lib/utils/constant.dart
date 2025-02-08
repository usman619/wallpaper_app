import 'package:flutter_dotenv/flutter_dotenv.dart';

String supabaseUrl = dotenv.env['SUPABASE_URL'].toString();
String supabaseKey = dotenv.env['SUPABASE_KEY'].toString();
