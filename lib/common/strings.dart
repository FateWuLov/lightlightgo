import 'dart:io';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/manager/BossManager.dart';

class Strings {

  static const String question = 'Question:';
  static const String submitSuccessfully = 'Submit Successfully!';
  static const String viewDetails = "View Details";
  static const String askNow = 'Ask Now';
  static const String reply = 'Reply:';
  static const String inputQuestionTips = 'Please input your question';

  //title
  static const String message = 'Message';
  static const String order = 'Orders';
  static const String advisor = 'Advisors';
  static const String premium = 'Premium';
  static const String selectDuration = 'Select Duration';
  static const String addMinutes = 'Add Minutes';
  static const String startChat = 'Start Chat...';
  static const String draft = 'Draft';

  //result tips
  static const String success = 'Success';
  static const String failed = 'Failed';
  static const String loginFail = 'Login Fail';
  static const String uploadImageFail = 'Upload Image Fail';
  static const String updateSuccess = 'Update Success';
  static const String savedSuccess = 'Saved Successfully';
  static const String requestFailed = 'Failed to request.';
  static const String purchaseSuccess = 'Purchase Success!';
  static const String facebookFailed = 'Facebook Login Failed';
  static const String cancelLogin = 'Canceled';
  static const String phoneFailed = 'Phone Login Failed';
  static const String appleFailed = 'Apple Login Failed';
  static const String googleFailed = 'Google Login Failed';
  static const String playFailed = 'Play Failed';
  static const String pauseFailed = 'Pause Failed';
  static const String starBusyNow =
      'The advisor you’d like to connect is busy now, please call again later.';
  static const String starOfflineNow =
      'The advisor you’d like to connect is not available now, please call again later.';
  static const String sendMessageFailed =
      "Failed to send message, please check your internet connection and try again.";

  static const String advisorNotAvailable =
      "Sorry, the advisor is temporarily not available now.";
  static const String lowVersionSendMsg = 'You cannot send picture now due to the recipient has not upgraded to the latest version, please remind him/her to update first.';

  //alert msg
  static const String notNull = 'Can not be null';
  static const String sureLeave = 'Sure to leave?';
  static const String leaveLoseTips =
      'If you leave now, you will lose all the changes content.';
  static const String ageSmallTips =
      'Sorry, please make sure that you are at least 18 years old to submit the order.';
  static const String reportTips =
      'Thanks! We have received your report. We are going to handle it as soon as possible.';
  static const String creditsReAdd =
      'Your pending credits purchase has processed completely. The credits have been re-added to your account, please check it.';
  static const String tipsNote = 'Please note that your tip is non-refundable.';
  static const String lowAccuracyNote =
      'You are rating the psychic with a low accuracy percentage, are you sure to submit?';
  static const String tipsContent =
      'Decide the tip amount by yourself to \nexpress the appreciation.';
  static const String sureEndChat = 'Sure to end the chat?';
  static const String cannotBackInCall =
      'Please note that you cannot back in call after ending it.';
  static const String sureCancelOrder = 'Sure to cancel the order?';
  static const String cancelOrderNotes =
      'If you cancel now, you will lose all info filled.';
  static const String kickOutTips =
      'You\'ve been disconnected by the server because your account was used to login on another device.';
  static const String limitWordsWarn =
      'Your message contains inappropriate words, please modify and resend.';
  static const String microForVideoChat =
      'Please allow us to access your microphone to continue the live video chat.';
  static const String microForAudioChat =
      'Please allow us to access your microphone to continue the live audio chat.';
  static const String cameraForVideoChat =
      'Please allow us to access your camera to continue the live video chat.';
  static const String cameraForUploadMedia =
      'Please allow us to access your camera to upload media.';
  static const String photosForSaveMedia =
      'Please allow us to access your photos to save media to album.';
  static const String photosForUploadMedia =
      'Please allow us to access your photos to upload media from album.';
  static const String blockMsg = 'Block Chat';
  static const String blockAlertTitle = 'Sure to block message?';
  static const String blockContent = 'You can no longer chat with %s.';
  static const String unblockMsg = 'Unblock Chat';
  static const String blockSuccess = 'You have blocked chat with %s.';
  static const String unblockSuccess = 'You can chat with %s now.';
  static const String sendMsgFailedBlockHim =
      'Failed to send. You have blocked chat with %s.';
  static const String sendMsgFailedBlockMe =
      'Failed to send. Your message has been rejected.';
  static const String createDraftTitle = 'The advisor you’d like to consult is not available for this service now.';
  static const String createDraftMsg = 'You can create a draft order and easily submit when your advisor back online.';
  static const String saveOrderAsDraft = 'You can save the order request as draft and then easily submit later.';
  static const String saveOrder = 'Save Order?';
  static const String sureDeleteDraft = 'Sure to delete this draft?';
  static const String deleteDraftMsg = 'Delete cannot be recalled.';
  static const String sureQuitDraft = 'Sure to quit this draft?';
  static const String saveDraftEditLater = 'You can save the draft and edit it later.';
  static const String reviewCopiedClipboard = 'Review has submitted successfully and copied to the clipboard.';
  static const String leaveReviewOnStore = 'We are glad to see you had a great experience with us. It is appreciate to leave ${Info.appName} a good review on store to tell more people about this wonderful app!';

  //actions
  static const String cancel = 'Cancel';
  static const String confirm = 'Confirm';
  static const String done = 'Done';
  static const String submit = 'Submit';
  static const String explore = 'Explore';
  static const String save = 'Save';
  static const String yes = 'Yes';
  static const String leave = 'Leave';
  static const String buy = 'Buy';
  static const String buyNow = 'BUY\nNOW';
  static const String tryIt = 'Try It';
  static const String tip = 'Tip';
  static const String ok = 'OK';
  static const String gotIt = 'Got It';
  static const String search = 'Search';
  static const String openSettings = 'Open Settings';
  static const String report = 'Report';
  static const String reset = 'Reset';
  static const String maybeLater = 'Maybe Later';
  static const String createDraft = 'Create Draft';
  static const String saveAsDraft = 'Save as Draft';
  static const String deleteDraft = 'Delete Draft';
  static const String discard = 'Discard';
  static const String goToStore = 'Go to Store';
  static const String topUp = 'Top Up';
  static const String browseAdvisors = 'Browse Advisors';
  static const String sendMessage = 'Send Message';
  static const String tryAgain = 'Try Again';
  static const String getResult = 'Get Result';
  static const String and = 'and';

  //login
  static const String loginPhone = 'Continue with Phone Number';
  static const String loginFacebook = 'Continue with Facebook';
  static const String loginApple = 'Continue with Apple';
  static const String orConnectWith = 'Or connect with';
  static const String terms = 'Terms of Use';
  static const String privacy = 'Privacy Policy';
  static const String signUp = 'Sign up or Login';
  static const String slogan = 'Your Best Pocket Life Coach.';
  static const String signInToDiscover = 'Sign in to discover ';
  static const String specialOffer = 'SPECIAL OFFER ';
  static const String forNewUsers = 'for new users!';
  static const String loginTips = 'Login means you agree';
  static const String signIn = 'Sign In';
  static const String bindAccount = 'Bind Account';
  static const String linkAccount = 'Link Account';
  static const String logIn = 'Log In';
  static const String guestLogin = 'Guest Login';

  //order
  static const String orderStatus = 'Order Status';
  static const String all = 'All';
  static const String expired = 'Expired';
  static const String declined = 'Declined';
  static const String canceled = 'Canceled';
  static const String awaitingReceipt = 'Awaiting Receipt';
  static const String pending = 'Pending';
  static const String completed = 'Completed';
  static const String waitReply = 'Wait for Advisor to Deliver Reply';
  static const String orderRequest = 'Order Request';
  static const String textServiceTitle = 'Text Reading';
  static const String audioServiceTitle = 'Audio Reading';
  static const String videoServiceTitle = 'Video Reading';
  static const String any24hReading = '24h Delivered Reading';
  static const String text24hServiceTitle = '24h Text Reading';
  static const String audio24hServiceTitle = '24h Audio Reading';
  static const String video24hServiceTitle = '24h Video Reading';
  static const String liveTextChat = 'Live Text Chat';
  static const String liveAudioChat = 'Live Audio Chat';
  static const String liveVideoChat = 'Live Video Chat';
  static const String anyLiveChat = 'Live Chat';
  static const String noCommentTips = 'You have not left a comment.';
  static const String attachPicture = 'Attach Picture';
  static const String missingFile = 'Missing file.';
  static const String lackOfInformation = 'Lack of important information?';
  static const String add = 'Add';
  static const String noOrder = 'There is no order yet, find your matched advisor and ask now.';

  static const String readingServiceSubTitle = 'Delivered within 24h';
  static const String checkDetails = 'Check Details';
  static const String requestDetails = 'Request Details';
  static const String noOrderTips = 'Oops, there is no related order.';
  static const String dueTime = 'Due Time';
  static const String deliveryTime = 'Delivered Time';
  static const String startTime = 'Start Time';
  static const String endTime = 'End Time';
  static const String orderTime = 'Ordered Time';
  static const String canChatFor = 'You Can Chat For:';
  static const String readingServices = 'Reading Services';
  static const String servicesContent =
      'Choose from all available services provided\nbelow and continue.';
  static const String advisorLeaveContent =
      'The advisor is temporarily absent.';

  //edit
  static const String profileEdit = 'Profile Edit';
  static const String name = 'Name';
  static const String bio = 'Bio';
  static const String aboutMe = 'About Me';
  static const String gender = 'Gender';
  static const String orderInstruction = 'Order Instruction';
  static const String instruction = 'Instruction:';
  static const String instructionHold =
      'Give instruction that you hope users to follow when placing order with you';
  static const String showLess = 'Show Less';
  static const String showMore = 'Show More';
  static const String enterName = 'Enter your name';
  static const String selectBirth = 'Select date of birth';
  static const String dateBirth = 'Date of Birth';
  static const String situationHold =
      'Describe your situation in certain sentences will help the advisors know your status better to further improve the accuracy and service quality';
  static const String situationTitle = 'General Situation';
  static const String questionHold = 'One question only';
  static const String questionTitle = 'Specific Question';
  static const String writeMessage = 'Write your message here';
  static const String enterBio = 'Enter your bio';
  static const String tellOthers = 'Tell others more about yourself';
  static const String userId = 'UserID';
  static const String copiedUserId = 'UserID has been copied.';
  static const String clarificationTitle = "Additional Information";
  static const String pasteHint = 'Paste from last submitted order';
  static const String followUp = 'Follow-up';

  //placeholder
  static const String male = 'Male';
  static const String female = 'Female';
  static const String notSpecified = 'Not Specified';
  static const String inputNameTips = 'Please input your name';
  static const String inputBirthTips = 'Please input your birth';
  static const String inputGenderTips = 'Please input your gender';
  static const String inputSituationTips = 'Please input your situation';
  static const String messageHint = 'Message...';
  static const String selectReplyHint = 'Select message.';

  static const String replyPlaceHolder = 'Reply to the advisor…';
  static String min(int count) => 'min${count > 1 ? 's' : ''}';
  static const String suggestedDuration = 'Suggested Duration';
  static const String chatTopUpTips =
      'Live chat will end in %ss, please top up credits to continue.';
  static const String chatLeftTimeTips = 'You have %s minutes left to chat.';

  //user info
  static const String showMoreReviews = 'Show More Reviews';
  static const String contactNow = 'Contact Now';
  static const String chatFree = 'Chat Free';
  static const String about = 'About Me';
  static const String reviews = 'All Reviews';
  static const String aboutHold = 'The user has left nothing here yet';
  static const String anonymous = 'Anonymous';
  static const String topAccuracy = 'Top Accuracy';
  static const String reading = 'Reading';
  static const String review = 'Review';
  static const String accurate = 'Accurate';
  static const String responseIn = 'Response In';
  static const String onTime = 'On-time';
  static const String serviceCategory = 'Service Category';
  static const String busy = 'Busy';
  static const String inService = 'In Service';
  static const String outOfService = 'Out of Service';
  static const String live = 'Live';

  //setting
  static const String sureLogOut = 'Sure to log out?';
  static const String inviteFriends = 'Invite Friends';
  static const String inviteMoreFriends = 'Invite More Friends';
  static const String enterInviteCode = 'Enter Invite Code';
  static const String feedback = 'Feedback';
  static const String settingWebsite = 'Move to Website';
  static const String settingRateUs = 'Love ${Info.appName}? Rate Us';
  static const String logout = 'Logout';
  static const String becomeAnAdvisor = 'Apply for Advisor';
  static const String logoutContent =
      'Don’t worry, your credits and reading history will be kept.';
  static const String mine = 'Mine';
  static const String me = 'Me';
  static const String id = 'ID:';
  static const String bonusTips = 'Bonus credits awaiting your check!';
  static const String rechargeNow = 'Recharge Now';

  //coin
  static const String purchasePageTitle = 'Buy Credits';
  static const String tipAdvisor = 'Tip Advisor';
  static const String customize = 'Customize';
  static const String enterAmount = 'Enter amount';
  static const String enterYourTipAmount = 'Enter your tip amount';
  static const String enterAvailableTipAmount =
      'Please enter a valid amount and try again.';
  static const String thanksSupport = 'Thanks for your support!';
  static const String tipAdvisorContent =
      'Been helped and feel much better now? Say thanks to your psychic advisor by sending her/him a tip.';

  static const String durationEnoughCredits =
      'To ensure reading quality, please sure you enough credits to pay for minimum 3 min of chat session. Unused credits will be kept in your account for other reading service.';
  static const String additionalCreditsTitle = 'To ensure the service quality,\nCredit for Minimum 3 min is Suggested:';
  static const String additionalCreditsRequest = 'Additional Credits Required';
  static const String creditsBreakdowns = 'Credits Breakdowns';
  static const String currentBalance = 'Current Balance';
  static const String enoughCreditsNow = 'You got enough credits now!';
  static const String hangUpLiveChat =
      'You can hang up the live chat at anytime. Unused credits will be kept in your account for other reading service.';
  static const String saveUpToWebsite = "Save Up to 35% OFF in Website.";

  //rate
  static const String rateReview = 'Rate & Review';
  static const String rateAndReview = 'Rate & Review';
  static const String rating = 'Rating';
  static const String tapToRate = 'Are you satisfied? Tap to rate.';
  static const String rateAccuracy = 'Feel accurate? Rate the accuracy.';
  static const String writeReview = 'Write Review';
  static const String reviewHint =
      'Share your feeling about the session. Your comment will be shown on public after reviewing.';

  static const String processing = 'Processing…';
  static const String buyCredits = 'Buy Credits';
  static const String buyCreditsContent = 'Top up credit account for readings.';

  // recharge
  static const String off = 'OFF';
  static const String credits = 'Credits';
  static const String only = 'only';
  static const String forFirstRecharge = 'for your first top up!';
  static const String saleEnds = 'SALE ENDS IN';
  static const String saleStartIn = 'SALE STARTS IN';
  static const String firstOrderDiscount =
      'Enjoy 30% OFF Discount of Your First 24h Reading';

  // calling page
  static const String connectingWithPoint = 'Connecting...';
  static const String connecting = 'Connecting';

  static const String callingTips1 =
      'For maintaining a harmonizing atmosphere, please do not \nsend any violent, sexual, abusive or fraudulent content.';

  static const String callingTips =
      'For maintaining a harmonizing atmosphere, please do not send any violent, sexual, abusive or fraudulent content.';
  static const String starBusy =
      'The advisor is busy now, please call again later.';
  static const String callDeclined = 'Call declined';
  static const String callEnd = 'Call ended';
  static const String callCanceled = 'Call canceled';
  static const String youLeft = 'You left';
  static const String callExpired = 'Call expired';
  static const String callCut = 'Call cut';

  static const String satisfiedSessionTips =
      'Are you satisfied with this session?';
  static const String alreadySubmitReview =
      'You have already submitted the review.';
  static const String checkTheReview =
      'Please go to the correspondent order detail page to check the review just submitted.';

  static const String chatNotifyTips = "To protect privacy from being disclosed, please do not provide or exchange any personal contact information with advisors.";

  //chat
  static const List<String> defaultPresetReplyWords = ['I would like to connect with you. Please notify me when you are available.', 'Thanks.', 'Sure.', 'No problem.', 'Ok, I will call you soon.', 'Please wait a moment.', 'When shall we talk?', 'How long time it will be?', 'How much is it?', 'Sorry, I’m not available now.', 'Have a nice day!'];

  //star list page & best math page
  static const String bestMatchTitle = 'Best Match Result';
  static const String findNewMatch = 'Find New Match';
  static const String bestMatch = 'Best Match';
  static const String recentViewed = 'Recent Viewed';
  static const String allAdvisors = 'All Advisors';
  static const String featured = 'FEATURED';
  static const String staffPick = 'Staff Pick';
  static const String liveChat = 'Live Chat';
  static const String newStar = 'New Advisor';
  static const String edit = 'Edit';
  static const String filter = 'Filter';
  static const String clearFilter = 'Clear Filter';
  static const String liveChatVia = 'Live Chat via';
  static const String readingVia = '24h Delivered Reading via';
  static const String availableToConnect = 'Available to Connect';
  static const String availableRush = 'Available to deliver in 1h';
  static const String text = 'Text';
  static const String audio = 'Audio';
  static const String video = 'Video';
  static const String any = 'Any';
  static const String priceRange= 'Price Range';
  static const String filterEmpty= 'There is no result found under your filter condition. Please adjust and try again.';

  //tag select page.
  static const String getAdvice = 'Get Best Match';
  static const String getAdviceGuide =
      'What type of psychic advice would you like help with?';
  static const String loveTag = 'Love & Relationship';
  static const String careerTag = 'Career Advice';
  static const String marriageTag = 'Marriage';
  static const String spiritualTag = 'Spiritual Reading';
  static const String moneyTag = 'Money & Finance';
  static const String lifeTag = 'Life Path';
  static const String familyTag = 'Family';
  static const String lostTag = 'Lost People & Pets';
  static const String healthTag = 'Heart Healing';
  static const String dreamTag = 'Dream Analysis';
  static const String readingTag = 'General Reading';

  static const String specificSkillsTitle = 'What specific skills do you want advisors to possess?';
  static const List<String> specificSkillsList = ['Clairvoyant', 'Tarot', 'Dream Analysis', 'Horoscope Analysis', 'Oracle Guidance', 'Empath', 'Angel Insight', 'Not Sure'];

  static const List<String> serviceCategories = ['Psychic Readings', 'Tarot Reading', 'Dream Analysis', 'Horoscopes', 'Oracle Guidance', 'Relationship Coaching',  'Angel Insight' ];

  static const String getAdviceStyleTitle = 'How would you like to get advice?';
  static const String exprienceLevelTitle = 'What level of exprience are you looking for?';
  static const List<String> exprienceLevelList = ['Moderate', 'Expert', 'Master'];

  //内置消息
  static const String newerGreet =
      'Hi, welcome to ${Info.appName}, the most trustworthy online psychic platform in the world. Whatever your needs, we’ll support you to find the answers💗';

  static const String becomeAnAdvisorGreet =
      'Thanks for your interest in joining ${Info.appName}. Please send your name, contact email address and a brief self-introduction to us by directly replying this message. Our recruitment staff will further guide you step by step to complete the psychic application process. Looking forward to your join : )';

  static const String badRatingGreet = 'We always attach great importance to user experience. If you have any question or advice about the service, please leave us messages, we will get back to you as soon as possible.';

  static const String assistentGreet =
      'Hi %s, nice to meet you. I\'m your assistant Luna😉 You are the best gift for ${Info.appName} and now check what I have got for you :)';

  static const String searchEmptyTip =
      "There is no result found under your filter condition. Please adjust and try again.";

  static const String notificationBannerTitle = "Enable push notifications";
  static const String notificationBannerDesc = "You won’t miss anything.";
  static const String notificationBannerTurnOn = "Turn on";

  static const String notificationTipTitle = "Don't miss out!";
  static const List<String> notificationTipDescList = [
    "Be notified with reading updates.",
    "Never miss messages from your advisors.",
    "Get app-only exclusive offer Information.",
  ];
  static const String notificationTipEnable = "Enable";
  static const String notificationTipLater = "Later";

  static const String findAdvisor = 'Find your favorite advisor';
  static const String exploreCategories =
      'Explore categories and find the \nright advisor for you.';
  static const String getMatched = 'Get Matched';

  static const List<String> launchGuideTitles = [
    "Get insight by\n${Info.appName} advisors",
    "Connect via online live text, audio & video chat",
    "Share your questions by\nplacing an order",
  ];
  static const List<String> launchGuideDescs = [
    "Experienced, talented & professional. Advisors are 24/7 standing by in case you need help.",
    "Start from just \$1.2/min. Be guided in-time and find the answers immediately toward your worries.",
    "Receive in-depth reading about love, relationship, career, future, spirituality & more. Go enjoy our welcome offer & recharge discount for new users now :)"
  ];
  static const String skip = "Skip";
  static const String getStarted = "Get Started";
  static const String congratulations = "Surprise Gift!";
  static const String congrats = "Congrats!";

  static const String levelUpRewardGreet =
      "Hi %s, we have an exclusive gift for you.";
  static const String openIt = "Open it";
  static const String moreSurprisesInWebsite = "Have you tried ${Info.appName} Web? —> Much more top-up package options with EXCLUSIVE DISCOUNT & BONUS CREDITS awaiting you to discover! Move to Web Now 👉👉👉 ${Info.ourWebsiteSymbol} (*No need to login & Purchased credits will be automatically synced with your ${Info.appName} app account.)";
  static const String youHaveClaimed = "You have claimed";
  static const String supriseGift = "Surprise Gift";
  static const String tapToOpen = "Tap to Open";
  static const String defaultAutoResp =
      'Thanks for choosing me & sharing your questions, I will look into your situation and soon get back to you: )';
  static const String UMayAlsoLike = "Advisors You May Also Like";

  static const String inviteRewardSuccessMessage =
      "So lucky to get %s reading credits! You can now invite friends to get more bonus credits.";
  static const String levelUpRewardCongratulations =
      "So lucky to get %s reading credits! It's time to connect your advisors now.";

  static const String liveCallNetworkErrorTip =
      "Oops, chat ended due to the unstable internet connection. Please check your network and try again.";

  static const String levelUpRewardPushStr =
      "Hi %s, we have this gift for you. Hope you like it!";

  static const String noRecommendAdvisorFound =
      'There is no result found.Please adjust and try again.';

  static const String searchInputHitText = 'Search by advisor name or any key words.';
  static const String hot = 'Hot';
  static const String inputQuestionExceedLimit = 'Exceed the maximum character limit, please modify and submit.';

  static const String enjoyApp = 'Enjoy ${Info.appName}?';
  static const String appRateTip = 'We really appreciate if you give ${Info.appName} a 5-star rating and leave a good review.';
  static const String appRateUs  = 'Rate us';

  static const List<String> defaultHotWords = ['Love', 'Relationship Coaching', 'General Reading', 'Tarot', 'Career', 'Dream Analysis'];

  static const String notificationSettings = 'Notification Settings';

  static const String openNotification24hTip = 'Notify Me When Advisor Becomes Available for 24h Delivered Readings:';
  static const String openNotificationLiveChat = 'Notify Me When Advisor Becomes Available for Live Chat:';
  static const String applyNotificationSettings = 'Apply';
  static const String applySuccessfully = 'Applied successfully';
  static const String applyFailed = 'Applied failed';

  static const String failToConnect = 'Fail to connect';
  static const String advisorIsBusyTitle = 'The advisor you’d like to consult is busy in call now.';
  static const String advisorIsNotAvailableTitle = 'The advisor you’d like to consult is currently not available for this service now.';
  static const String notifiedAdvisorAvailable = 'Wanna be notified when the advisor becomes available?';
  static const String noThanks = 'No, thanks';
  static const String notifyMe = 'Notifiy Me';

  static const String guideToRateReview = 'Are you satisfied? We’d like to hear your feedback : )';

  static const String inviteCard = 'Invite Card';
  static const String inviteRecord = 'Invite Record';
  static const String loveInviteFriends = 'Love ${Info.appName}?\nInvite your friends to join!';
  static const String inviteFriendsJoin = 'Inspired by ${Info.appName} advisors? Invite your friends to join & get ';
  static const String inviteFriendsJoinEnd = ' credits!';
  static const String inviteFriendsBothYouWill = 'Invite your friends to experience ${Info.appName} and both of you will get %s reading credits as invitation reward when your friends input your code & made first purchase.';
  static const String rewardedOnceFriendCompletes = '%s credits will rewarded once your friend completes the first reading order.';
  static const String copiedInviteCode = 'Invite code copied.';
  static const String sendInviteVia = 'Send invite via';
  static const String getReadingInsights = 'Get reading insights into their life questions. We believe they will find it fantastic too.';
  static const String myFriends = 'My friends';
  static const String rewards = 'Rewards';
  static const String status = 'Status';
  static const String claim = 'Claim';
  static const String claimed = 'Claimed';
  static const String inviteRecordEmpty = 'There’s no friends input your code yet.\nInvite more people to get the invite rewards!';
  static const String getCreditsAfterFriendOrder = 'You can get %s credits after your friend makes first top up.';
  static const String shareText = 'I\'ve been inspired by this free psychic app ${Info.appName}, where you can get psychic advice from gifted readers - anywhere, at anytime and get reading insights into your life questions. I am sure you will find it fantastic too. Check it in the AppStore or in Google Play and get special first time offer!';
  static const String shareTextWithCredits = 'I\'ve been inspired by this free psychic app ${Info.appName}, where you can get psychic advice from gifted readers - anywhere, at anytime and get reading insights into your life questions. I am sure you will find it fantastic too. Check it in the AppStore or in Google Play, use my code %s to get %s BONUS CREDITS!';
  static const String newShareTextWithCredits = 'I’ve been inspired by this free psychic app ${Info.appName}, where you can get psychic advice from gifted readers - anywhere, at anytime and get reading insights into your life questions. I am sure you will find it fantastic too. I’m sending you %s FREE CREDITS GIFT, enter my code %s & come experience to get the gift!';
  static const String shareSubject = 'Invitation Letter - Free Psychic Reading';

  static const String enterInviteCodeTitle = 'Received an invite code\nfrom friend?';
  static const String enterInviteCodeMsg = 'We will send respectively %s reward credits to you and your friend when you have made first top up on site.';
  static const String congratsRewardClaim = 'Congrats! You have successfully got %s reward credits, tap "Claim"!';
  static const String topUpTitle = 'Top up reading credits first to place an order with your matched advisor.';
  static const String topUpMsg = 'We will send respectively %s reward credits to you and your friend when you have made first top up on site.';
  // static const String completeOrderTitle = 'Just one step left to get reward credits! Go complete your first reading order now.';
  // static const String completeOrderMsg = 'We will send respectively %s reward credits to you and your friend when you have made first top up on site.';

  static const String instagram = 'Instagram';
  static const String facebook = 'Facebook';
  static const String email = 'Email';
  static const String sms = 'SMS';
  static const String more = 'More';

  static const String installIns = 'Please install Instagram and try again.';
  static const String installFacebook = 'Please install Facebook and try again.';

  static const String speedUp = 'Speed Up';
  static const String deliveredWithin1h = 'Delivered within 1h';
  static const String deliveredWithin24h = 'Delivered within 24h';
  static const String speedUpSuccessfully = 'Speed Up Successfully!';
  static const String readingWillDeliveredWithin1h = 'Your reading will be prioritized and delivered within 1 hour.';
  static const String sureSpeedUp = 'Sure to speed up?';
  static const String paidWillReturnedBackExpired = '*The credits paid for speeding up will returned back to your account if it goes expired.';
  static const String speedUpDetail = 'Get instant guidance & No more need to wait for 24h! Your advisor is now delivering the reading within ';
  static const String oneHour = '1 HOUR';
  static const String onceYouPay = ' once you pay just extra 50% to speed up.';
  static const String nextTime = 'Next Time';
  static const String useExtraCr = 'Use extra %s Cr';

  static const String callCancelSendMsg = 'Not successfully connected? Let your advisor know you just called by leaving a message.';

  static const String connectingServer = 'Connecting to the server...';
  static const String willToChatOnceConnect = 'We will bring you to the chat room very soon once successfully connected.';

  static const String onlyShowReviewsWithComment = 'Only show reviews with comment';
  static const String noReviewYet = 'No review yet.';

  static const String album = 'Album';
  static const String camera = 'Camera';
  static const String image = 'Image';
  static String recommendTitleNewUser(bool twoLine) => 'Most people\'s choice.${twoLine ? '\n' : ' '}Try it!';
  static String recommendTitleOldUser(bool twoLine) => 'New advisor joined ${Info.appName}.${twoLine ? '\n' : ' '}Discover them!';

  static const String tarot = 'Tarot';
  static const String todayTarot = 'Today’s Tarot';
  static const String yesNoQuestion = 'Yes or No Questions';
  static const String loveFortune = 'Love Fortune';
  static const String newLove = 'New Love';
  static const String relationship = 'Relationship';
  static const String generalLove = 'General Love';
  static const String pickCard = 'Pick Card';
  static const String dragToHere = 'Drag to Here';
  static const String selectCard = 'Select card from the package';
  static const String itIsGoodTimeTo = 'It is a good time to:';
  static const String tarotWhatKnowMore = 'Wanna know more about your card?\nAsk ${Info.appName} advisor for details!';
  static const String oneStepGetTarot = 'Only one step left to get your tarot reading.';
  static const String surePickNewCards = 'Sure to pick new cards?';
  static const String loveTarotRepealed = 'Your current result will not be saved.';
  static String freeTarotTime(int time) => 'FREE TAROT FOR $time TIME${time > 1 ? 'S' : ''}';
  static const String tarotShare = 'I got a in-depth insight in this free psychic app ${Info.appName},  where you can get psychic advice from gifted readers- Anywhere, at anytime and get reading insights into your life questions. I am sure you will find it fantastic too. Check it in the AppStore or in Google Play and get special first time offer! ${Info.tarotShareLink}';
  static const String starActiveTips = 'The advisor is on the way to give you the most insightful experience...';
  static const String saveResultAndAsk = 'Save Result & Ask Tarot Reader';

  static const String selectAccountContinue = 'Select Account to Continue';
  static const String findLoggedInBefore = 'We find that you have logged in ${Info.appName} before, please select the account you want to use and continue.';
  static const String sureContinueNew = 'Sure to continue with the new one?';
  static const String noteCannotRecoverAccount = 'Please note that you cannot recover the previous ${Info.appName} account once confirmed.';
  static const String goBack = 'Go back';
  static const String continueButton = 'Continue';

  static const String serviceTitle = "Service Name";
  static const String duration = "Duration";
  static const String period = "Period";
  static const String details = "Details";
  static const String serviceDescription = "Service Description";
  static const String premiumServiceNote = "Please note that premium service purchase is non-refundable.";
  static const String premiumConfirmTip = "Your service session has completed, please help us to confirm it.";
  static const String orderId = "OrderID: ";
  static const String copiedOrderId = 'Order ID has been copied.';
  static const String premiumServiceBuySuccessTitle = 'Buy Service Successfully!';
  static const String premiumServiceBuySuccessContent = 'During the service, you can connect with the advisor about service progress at any time';
  static const String premiumServiceConfirmationTitle = 'Service Confirmation';
  static const String premiumServiceConfirmationContent = 'The advisor will get the payment once you confirm it.';
  static const String searchOrderHint = 'Search by Psychic Name/ Order Content';
  static const String searchPremiumServiceHint = 'Search by advisor/service content';


  static String day(int count) => 'Day${count > 1 ? 's': ''}';

  static const String premiumService = 'Premium Service';
  static const String premiumServiceOutOfService = 'Failed to buy. The advisor is not available for the service now.';
  static const String connectNow = 'Connect Now';
  static const String averagePrice = '*\$1.0=10 credits. The average price of 1 reading is 100 credits';
  static String getFreeCredits = 'Get Free ${BossManager.instance.inviteRewardStr()} Credits!';
  static String inviteFriendsAndGetReward = 'Invite your friends to experience ${Info.appName} and both of you will get ${BossManager.instance.inviteRewardStr()} credits as inviatation reward.';
  static const String inviteNow = 'Invite Now';

  static const String freeCredits = 'Free Credits';
  static const String bindEmail = 'Bind Email';
  static const String bindYourEmailToReceive = 'Bind your email to receive';
  static const String exclusiveOffer = 'Exclusive Offer';
  static const String promotionInformation = 'Promotion Information';
  static const String newJointAdvisorsIntroduction = 'New Joint Advisors\' Introduction';
  static String enterEmail = 'Enter your email to get ${BossManager.instance.bossConfig.appInfoConfig.bindedEmailReward} credits';
  static String enterEmailNotCredits = 'Enter your email address';
  static const String next = 'Next';
  static const String enterVerificationCode = 'Enter the 6-digit code we sent to:';
  static const String resentCode = 'Resend Code';
  static const String resentInAMin = 'Resend 01:00';
  static const String yourEmail = 'Your email:';
  static const String changeEmail = 'Change Email';
  static const String unbind = 'Unbind';
  static const String emailIsNotValid = 'Please enter a valid email adress.';
  static const String emailProtectedTip = '*Your email address will be strictly protected and will not be provided to anyone including your advisor.';

  static const String bindEmailSuccess = 'Bind Emial Successfully!';


  static const String beDirectAndKeepItReal = 'Be direct & Keep it real';
  static const String gentleAndEmpathetic = 'Gentle and Empathetic';

  static const String export = "Export";
  static const String online = 'Online';
  static const String absent = 'Absent';
  static const String notification = 'Notification';

  static const String yesNoLeading1 = "Find a quiet place...";
  static const String yesNoLeading2 = 'Clean your mind...';
  static const String yesNoLeading3 = 'Take a deep breath...';
  static const String yesNoLeading4 = 'Ask a yes/no question for this\ntarot reading...';

  static const List<String> loveFortuneSymbol = [
    'Past',
    'Present',
    'Future'
  ];

  static const List<String> newLoveQuestion = [
    'Are you ready for love?',
    'Meeting new love',
    'Challenges'
  ];
  static const List<String> relationshipQuestion = [
    'What brings you together?',
    'What pulls you apart?',
    'What needs work?'
  ];
  static const String answerIs = 'The Answer is';
  static const String sortBy = 'Sort by';
  static const String sortByDefault = 'Default';
  static const String sortByMostReading = 'Most Readings';
  static const String sortByMostReviews = 'Most Reviews';
  static const String sortByTopRated = 'Highest Rated';
  static const String sortByVotedMostAccurate = 'Voted Most Accurate';

  static List<String> sortStrs = [
    advisor,
    sortByMostReading,
    sortByMostReviews,
    sortByTopRated,
    sortByVotedMostAccurate,
  ];

  static const String networkErrorPlaceholder = 'No Internet\nOops, Lost Internet Connection.';
  static const String refresh = "Reconnect";

  static const String serviceNotAvailable = '%s is not available for this service now';
  static const String busyInCall = '%s is now busy in call.';
  static const String informedTheAdvisorsState = 'Wanna be informed when the advisor becomes available?';
  static const String tryOtherAdvisor = 'Hey, why not try our recommended advisor who is available to help you first?';

  static const String servicePreview = 'Service Preview';
  static const String seeWhatYouWillGet = 'See what you will get';
  static const String textReading = 'Text\nReading';
  static const String audioReading = 'Audio\nReading';
  static const String videoReading = 'Video\nReading';
  static const String dialogTextReading = 'Text Reading';
  static const String dialogAudioReading = 'Audio Reading';
  static const String dialogVideoReading = 'Video Reading';
  static const String dialogTextReply = 'The actual text reply is more than 500 words.';
  static const String dialogAudioReply = 'The actual audio reply is longer than 3 minutes.';
  static const String dialogVideoReply = 'The actual video reply is longer than 3 minutes.';
  static const String liveText = 'Live Text';
  static const String liveAudio = 'Live Audio';
  static const String liveVideo = 'Live Video';
  static const String advisorsReply = 'Advisor\'s Reply:';
  static const String serviceSample = 'Service Sample';


  static const String advisorLeaderboard = "Advisor Leaderboard";
  static const String seeMore = "See More";
  static const String send = "Send";

  static const String getYourFirstReading = 'Find Your Best Match Advisor';
  static const String connect = "connect";
  static const String tarotResultRecommendTitle = 'Connect with professional tarot \n readers for more detailed guidance.';

  static const String dailyBonus = "Daily Bonus";
  static const String myFavorites = "My Favorites";
  static const String noFavoriteAdvisor = "You have no favorite advisor yet, browse advisor list and we are sure you will find the one : )";
  static const String seeAllAdvisors = "See All Advisors";

  static const String exploreService = "Explore Service";

  static const String notSatisfied = "Seems that you're not satisfied this time?";
  static const String beWillingToHelp = "We are willing to help and meet your expectation, so please feel free to contact us if anything we could further assist with you.";
  static const String contactUs = "Contact Us";
  static String continueNativePay = "Continue purchase with ${Platform.isIOS ? 'Apple' :'Google'} Play";
  static const String getDiscountWeb = "Get discount from Web purchase";
  static const String faq = "FAQ";
  static const String mayWantToAsk = 'You may want to ask';

  static const String chatPurchaseBannerTips = "Send messages freely to the advisor after top-up.";

  static const String signInWithApple = 'Sign in with Apple';
  static const String signInWithPhone = 'Continue with Phone';
  static const String signInWithGoogle = 'Continue with Google';
  static const String notify = 'Notify';

  static const String today = 'Today\'s';
  static const String tarotToday = 'Tarot';
  static const String yesOrNoQuestion = 'Yes or No\nQuestion';
  static const String howsMyloveFortune = 'How’s my love fortune?';
  static const String relationshipLast = 'Will my relationship with\nhim/her last?';
  static const String meetLove = 'When will I meet\nmy new love?';
  static const String generalLoveTarot = 'General Love Tarot';
  static const String availableBalance = 'Available Balance';
  static const String addCredits = 'Add Credits';
  static const String others = 'Others';

  static const String callAgain = 'Call Again';
  static const String connectingWait = 'We\'re connecting you with %s now, please wait up to 90 seconds.';
  static const String connectingWaitStarActive = '%s is on the way to give you the most insightful experience...';
  static const String messageWithCallBack = 'Not successfully connected? Call back or let your advisor know you just called by leaving a message.';

  static const String freeMinutesCongrats = 'Congrats! Special Offer!';
  static const String enjoyFreeMinutes = 'Choose your psychic and Chat now. Enjoy your first 3 minutes for FREE!';
  static const String gotFreeMinutes = 'Got it!';
  static const String enjoyFreeLiveChat = 'Enjoy 3 FREE minutes on your live chat!';
  static const String freeTime = '3min FREE';

  static const String free3MinsStarted = 'Your 3 free minutes started';
  static const String free3MinsEnded = 'Paid session will start';
  static const String chat2minsTopUp = 'You have 2 minutes left to chat. To ensure the quality of chat, please top up your account.';
  static const String noEndChat = 'No, end the chat';
  static String pauseConversationBuy(String star) => 'Your chat is on pause now. To continue the conversation with ${star}, please top up your account.';
  static const String minCreditsRequired = 'Minumum Additional Credits Required:';
  static const String ensureQuality = 'To ensure the service quality,\nCredit for Minimum 3 min is Suggested:';

  static String callTimeOut(String star) => 'Oops, the advisor is not available to take your call at the moment. Let ${star} know you just called by leaving a message.';
  static String advisorDeclines(String star) => 'Oops, the advisor is not available to take your call at the moment. Let ${star} know you just called by leaving a message.';
  static String advisorBusy(String star) => 'Oops, the advisor is not available to take your call at the moment. Let ${star} know you just called by leaving a message.';
  static String advisorOffline(String star) => 'Oops, the advisor is not available to take your call at the moment. Let ${star} know you just called by leaving a message.';
  static String textCallTimeout = 'Timeout';
  static String textCallBusy = 'Busy';
  static String textCallDeclined = 'Declined';
  static String free = 'FREE';

  static const String liveAutoMessage = 'Hello, I\'m very happy in you choosing me as your reader. Please provide names and date of births of yourself and anyone in questioning or a picture for stong insights. Thank You!';

  static const List<String> typeList = ['Love & Relationship',
    'Horoscopes', 'Career Advice', 'Tarot Reading',
    'Dream Analysis', 'Psychic Readings', 'Angel Insight'];

  static String bindSignInMessage = 'To safely keep your information and purchase history, it is suggested to link the guest ID with one account and use it to sign in later.';
  static const String bindAccountFailMsg = 'Oops, failed to bind the account. Please check your internet connection and try again. If it still doesn\'t work, please contact us for further help.';
  static const String alreadySignInMsg = 'We found that you have already signed in Pocket Insight with an account on this device, please log in to continue.';
  static const String describeSituation = 'Describe your situation in certain sentences to help your advisor know better your status to further…';
}
