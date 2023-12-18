import 'package:flutter/material.dart';
import 'package:foochi/components/social_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/content_model.dart';

class SocialIconRow extends StatelessWidget {
  final VoidCallback googleCallback;
  final VoidCallback facebookCallback;
  final VoidCallback twitterCallback;
  const SocialIconRow(
      {super.key,
      required this.googleCallback,
      required this.facebookCallback,
      required this.twitterCallback});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SocialIcons(
                onTap: googleCallback,
                isGoogleIcon: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.kGoogle, height: 30),
                    const SizedBox(width: 14),
                    Text(
                      'with Google',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    )
                  ],
                ))),
        SocialIcons(
          onTap: facebookCallback,
          child: Image.asset(
            AppAssets.kFacebook,
            height: 30,
          ),
        ),
        SocialIcons(
          onTap: twitterCallback,
          child: Image.asset(
            AppAssets.kTwitter,
            height: 30,
          ),
        ),
      ],
    );
  }
}
