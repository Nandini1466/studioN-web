import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nstudio/src/design/constants/studio_colors.dart';
import 'package:nstudio/src/design/constants/studio_images.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeContactSectionV2 extends StatelessWidget {
  final VoidCallback onInstagramClicked;
  final VoidCallback onPhoneClicked;
  final VoidCallback onEmailClicked;

  const HomeContactSectionV2({
    super.key,
    required this.onInstagramClicked,
    required this.onPhoneClicked,
    required this.onEmailClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StudioColors.muted,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 32,
      ),
      child: Column(
        children: [
          Text(
            'Get in Touch',
            style: TextStyle(
              fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 36 : 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            'We are here to assist you with any questions or inquiries. Reach out to us via Instagram, phone, or email.\nFollow us on social media to stay updated with the latest news and exclusive offers.',
            style: TextStyle(
              fontSize: 18,
              color: StudioColors.mutedForeground,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24,
          ),
          _SocialOptionsRow(
            onInstagramClicked: onInstagramClicked,
            onPhoneClicked: onPhoneClicked,
            onEmailClicked: onEmailClicked,
          ),
        ],
      ),
    );
  }
}

class _SocialOptionsRow extends StatelessWidget {
  final VoidCallback onInstagramClicked;
  final VoidCallback onPhoneClicked;
  final VoidCallback onEmailClicked;

  const _SocialOptionsRow({
    required this.onInstagramClicked,
    required this.onPhoneClicked,
    required this.onEmailClicked,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = ResponsiveBreakpoints.of(context).isMobile ? 24.0 : 30.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          icon: SvgPicture.asset(
            StudioImages.instagramLogo,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          onPressed: onInstagramClicked,
        ),
        SizedBox(
          width: 16,
        ),
        _SocialButton(
          icon: Icon(
            Icons.phone_outlined,
            size: iconSize,
            color: Colors.black,
          ),
          onPressed: onPhoneClicked,
        ),
        SizedBox(
          width: 16,
        ),
        _SocialButton(
          icon: Icon(
            Icons.mail_outline,
            size: iconSize,
            color: Colors.black,
          ),
          onPressed: onEmailClicked,
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: icon,
        ),
      ),
    );
  }
}
