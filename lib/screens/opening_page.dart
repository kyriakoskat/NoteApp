import 'package:flutter/material.dart';

class OpeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Χρώματα
    final Color primaryColor = Color(0xFF6A5ACD); // Μωβ για κύριο κουμπί
    final Color secondaryColor = Color(0xFF8A7FCC); // Ανοιχτό μωβ για δευτερεύον κουμπί
    final Color headlineColor = Colors.black;
    final Color subtitleColor = Colors.grey[600]!;

    // Στυλ κειμένου
    final headlineTextStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: headlineColor,
    );

    final subtitleTextStyle = TextStyle(
      fontSize: 16,
      color: subtitleColor,
    );

    final buttonTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    final secondaryButtonTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Εικόνα
              Image.network(
                'https://via.placeholder.com/150',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.image_not_supported,
                    size: 150,
                    color: Colors.grey,
                  );
                },
              ),

              SizedBox(height: 40),

              // Τίτλος
              Text(
                "Explore our app",
                style: headlineTextStyle,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 8),

              // Υπότιτλος
              Text(
                "Now your notes are all in one place",
                style: subtitleTextStyle,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40),

              // Κουμπί "Sign In"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signIn');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, // Χρώμα για κύριο κουμπί
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Sign In", style: buttonTextStyle),
                ),
              ),

              SizedBox(height: 16),

              // Κουμπί "Create Account"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/createAccount');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor, // Χρώμα για δευτερεύον κουμπί
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Create account", style: secondaryButtonTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
