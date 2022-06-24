part of 'values.dart';

class MenuData {
  MenuData({required this.title, required this.routeName});

  final String title;
  final String routeName;
}

class CertificationData {
  CertificationData(
      {required this.title,
      required this.image,
      required this.imageSize,
      required this.url,
      required this.awardedBy});

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class PortfolioData {
  PortfolioData(
      {required this.title,
      required this.image,
      required this.imageSize,
      required this.subtitle,
      required this.portfolioDescription,
      this.technologyUsed = const [],
      this.isPublic = false,
      this.isOnPlayStore = false,
      this.isLive = false,
      this.gitHubUrl = "",
      this.hasBeenReleased = true,
      this.playStoreUrl = "",
      this.webUrl = "",
      this.imagesList = const []});

  final String image;
  final String portfolioDescription;
  final double imageSize;
  final String title;
  final String subtitle;
  final bool isPublic;
  final bool hasBeenReleased;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final String playStoreUrl;
  final bool isLive;
  final String webUrl;
  final List<String> technologyUsed;
  final List<String> imagesList;
}

class ExperienceData {
  ExperienceData(
      {required this.position,
      required this.roles,
      required this.location,
      required this.duration,
      this.company,
      this.companyUrl});

  final String? company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({required this.skillName, required this.skillLevel});

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<MenuData> menuList = [
    MenuData(title: StringConst.HOME, routeName: HomePage.routeName),
    MenuData(title: StringConst.ABOUT_ME, routeName: AboutPage.routeName),
    MenuData(title: StringConst.PORTFOLIO, routeName: PortfolioPage.routeName),
    MenuData(title: 'My Fav Quote', routeName: MyThoughtPage.routeName),
    MenuData(
        title: StringConst.EXPERIENCE, routeName: ExperiencePage.routeName),
    MenuData(title: StringConst.RESUME, routeName: StringConst.RESUME),
    MenuData(
        title: StringConst.CERTIFICATIONS,
        routeName: CertificationPage.routeName),
  ];

  static List<SkillData> skillData = [
    SkillData(skillLevel: 95, skillName: StringConst.FLUTTER),
    SkillData(skillLevel: 80, skillName: StringConst.DART),
    SkillData(skillLevel: 75, skillName: StringConst.ANDROID),
    SkillData(skillLevel: 80, skillName: StringConst.PYTHON),
    SkillData(skillLevel: 50, skillName: StringConst.JAVA),
    SkillData(skillLevel: 70, skillName: StringConst.WORDPRESS),
    SkillData(skillLevel: 60, skillName: StringConst.ADOBEXD),
    SkillData(skillLevel: 70, skillName: StringConst.FIREBASE),
    SkillData(skillLevel: 40, skillName: StringConst.POWERBI),
    SkillData(skillLevel: 60, skillName: StringConst.TABEALU),
  ];

  static List<SubMenuData> subMenuData = [
    SubMenuData(
      title: StringConst.KEY_SKILLS,
      isSelected: true,
      isAnimation: true,
      skillData: skillData,
    ),
    SubMenuData(
      title: StringConst.EDUCATION,
      isSelected: false,
      content: StringConst.EDUCATION_TEXT,
    ),
  ];
  static List<PortfolioData> portfolioData = [
    PortfolioData(
        title: StringConst.BILLING_APP,
        subtitle: StringConst.BILLING_APP_SUBTITLE,
        image: ImagePath.BILLING_APP,
        portfolioDescription: StringConst.BILLING_APP_DETAIL,
        imageSize: 0.3,
        hasBeenReleased: true,
        isLive: true,
        isPublic: false,
        imagesList: ImagePath.Lst_BILLING_APP,
        technologyUsed: [
          StringConst.FLUTTER,
          StringConst.FIREBASE,
          StringConst.GOOGLE_API
        ],
        webUrl: StringConst.BILLING_APP_WEB_URL),
    PortfolioData(
        title: StringConst.PRODUCT_CATALOG,
        subtitle: StringConst.PRODUCT_CATALOG_SUBTITLE,
        image: ImagePath.PRODUCT_CATALOG,
        portfolioDescription: StringConst.PRODUCT_CATALOG_DETAIL,
        imageSize: 0.20,
        hasBeenReleased: true,
        isPublic: true,
        isLive: true,
        technologyUsed: [StringConst.FLUTTER],
        playStoreUrl: StringConst.PRODUCT_CATALOG_WEB_URL,
        imagesList: ImagePath.Lst_PRODUCT_CATALOG),
    PortfolioData(
        title: StringConst.APP_DIRECT,
        subtitle: StringConst.APP_DIRECT_SUBTITLE,
        image: ImagePath.AppDirectApp,
        portfolioDescription: StringConst.APP_DIRECT_DETAIL,
        imageSize: 0.20,
        isLive: true,
        hasBeenReleased: true,
        technologyUsed: [StringConst.FLUTTER],
        playStoreUrl: StringConst.APP_DIRECT_WEB_URL,
        imagesList: ImagePath.Lst_AppDirectApp),
    PortfolioData(
      title: StringConst.PAWN_APP,
      subtitle: StringConst.PAWN_APP_SUBTITLE,
      image: ImagePath.PAWN_APP,
      imagesList: ImagePath.Lst_PAWN_APP,
      portfolioDescription: StringConst.PAWN_APP_DETAIL,
      imageSize: 0.3,
      isPublic: false,
      hasBeenReleased: true,
      isLive: true,
      technologyUsed: [
        StringConst.FLUTTER,
        StringConst.FIREBASE,
        StringConst.GOOGLE_API
      ],
      webUrl: StringConst.PAWN_APP_WEB_URL,
    ),
    PortfolioData(
      title: StringConst.LEDGER_APP,
      subtitle: StringConst.LEDGER_APP_SUBTITLE,
      image: ImagePath.LEDGER_APP,
      imagesList: ImagePath.Lst_LEDGER_APP,
      portfolioDescription: StringConst.LEDGER_APP_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      isLive: false,
      hasBeenReleased: true,
      technologyUsed: [StringConst.FLUTTER],
      playStoreUrl: StringConst.LEDGER_APP_WEB_URL,
    ),
    PortfolioData(
      title: StringConst.subbu_portfolio,
      subtitle: StringConst.subbu_portfolio_SUBTITLE,
      image: ImagePath.PORTFOLIO_WEB,
      portfolioDescription: StringConst.subbu_portfolio_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      isLive: true,
      hasBeenReleased: true,
      technologyUsed: [StringConst.FLUTTER],
      playStoreUrl: StringConst.subbu_portfolio_WEB_URL,
    ),
    PortfolioData(
      title: StringConst.EXPENCE_GEN,
      subtitle: StringConst.EXPENCE_GEN_SUBTITLE,
      image: ImagePath.ExpenceGenApp,
      imagesList: ImagePath.Lst_ExpenceGenApp,
      portfolioDescription: StringConst.EXPENCE_GEN_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      isLive: true,
      hasBeenReleased: true,
      technologyUsed: [StringConst.FLUTTER],
      playStoreUrl: StringConst.EXPENCE_GEN_WEB_URL,
    ),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.CET_DATA_SCIENCE,
      url: StringConst.DATA_SCIENCE_CERT_URL,
      image: ImagePath.IBM_Data_Science,
      imageSize: 0.27,
      awardedBy: StringConst.COUESERA,
    ),
    CertificationData(
      title: StringConst.CET_FLUTTER,
      url: StringConst.FLUTTER_CERT_URL,
      image: ImagePath.Flutter_Cred,
      imageSize: 0.27,
      awardedBy: StringConst.GOOGLE,
    ),
    CertificationData(
      title: StringConst.CET_DATA_SCIENCE,
      url: StringConst.DATA_SCIENCE_Board_Inf,
      image: ImagePath.Board_Infinity_Cred,
      imageSize: 0.27,
      awardedBy: StringConst.BOARDINFINITY,
    ),
    CertificationData(
      title: StringConst.CET_DATA_SCIENCE_K,
      url: StringConst.DATA_SCIENCE_KERAS,
      image: ImagePath.Deep_learn,
      imageSize: 0.27,
      awardedBy: StringConst.COUESERA,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_4,
      position: StringConst.POSITION_4,
      companyUrl: StringConst.COMPANY_4_URL,
      roles: [
        StringConst.COMPANY_4_ROLE_1,
        StringConst.COMPANY_4_ROLE_2,
        StringConst.COMPANY_4_ROLE_3,
        StringConst.COMPANY_4_ROLE_4,
      ],
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
        StringConst.COMPANY_3_ROLE_3,
        StringConst.COMPANY_3_ROLE_4,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
        StringConst.COMPANY_2_ROLE_3,
        StringConst.COMPANY_2_ROLE_4,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_1,
      position: StringConst.POSITION_1,
      companyUrl: StringConst.COMPANY_1_URL,
      roles: [
        StringConst.COMPANY_1_ROLE_1,
        StringConst.COMPANY_1_ROLE_2,
        StringConst.COMPANY_1_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
  ];
}
