class AppStrings {
  static String appName = "Citysync";

  static String commonValidation = "Please fill all the details";
  static String emailValidation = "Please enter a valid email";
  static String nameValidation = "Please enter a valid name";

  static String phoneValidation = "Please enter a valid phone number";
  static String lastNameValidation = "Please enter a valid first name";
  static String firstNameValidation = "Please enter a valid last name";
  static String profilePictureValidation =
      "Please select a valid profile picture";
  static String passwordValidation = "Please enter a valid password";
  static String usernameAlreadyExists = "Username already exists!";
  static String usernameIsEmpty = "Username is empty";
  static String usernameAvailable = "Username Available!";
  static String genderValidation = "Please select a valid gender";
  static String passwordErrorMessage =
      "Minimum 8 characters, at least 1 lower case, at least 1 upper case, at least 1 digit";

  static String next = "Next";
  static String previous = "Previous";
  static String skip = "Skip";

  static String welcome = "Welcome";
  static String welcomeBack = "Welcome Back!";
  static String completeYourProfile = "Complete Your Profile";
  static String editProfile = "Edit Profile";
  static String email = "Email";
  static String fullName = "Full Name";
  static String gender = "Gender";
  static String male = "Male";
  static String female = "Female";
  static String other = "Other";
  static String username = "Username";
  static String password = "Password";
  static String oldPassword = "Old Password";
  static String newPassword = "New Password";
  static String rememberMe = "Remember me";
  static String forgotPassword = "Forgot password?";
  static String continueWith = "Continue with";
  static String selectImageSource = "Select Image Source";
  static String camera = "Camera";
  static String gallery = "Gallery";
  static String signUp = "Sign Up";
  static String signIn = "Sign In";
  static String dontHaveAnAccount = "Don't have an account?";
  static String alreadyHaveAnAccount = "Already have an account?";
  static String save = "Save";
  static String changePassword = "Change Password";

  static String home = "Home";
  static String issues = "Issues";
  static String events = "Events";
  static String profile = "Profile";
  static String settings = "Settings";

  static String add = "Add";
  static String contribute = "Contribute";
  static String contributors = "Contributors";
  static String liveLimit = "Live Limit";
  static String liveNow = "Live Now";
  static String likes = "Likes";
  static String follow = "Follow";
  static String following = "Following";
  static String like = "Like";
  static String posts = "Posts";
  static String followers = "Followers";
  static String thereAreNoSentencesToDisplay =
      "There are no sentences to display";
  static String thereAreNoChatsToDisplay = "There are no chats to display";

  static String messages = "Messages";
  static String recently = "Recently";
  static String search = "Search";

  static String yourDeeds = "Your Deeds";
  static String badges = "Badges";
  static String donate = "Donate";
  static String donation = "Donation";
  static String campaign = "Campaign";
  static String event = "Event";
  static String charity = "Charity";
  static String more = "More";
  static String date = "Date";
  static String time = "Time";
  static String organization = "Organization";
  static String organizer = "Organizer";
  static String raised = "Raised";
  static String sharingKindness = "Sharing Kindness";
  static String latestIssues = "Latest Issues";
  static String newEvents = "New Events";
  static String seeAll = "See All";
  static String details = "Details";
  static String register = "Register";
  static String unRegister = "Un-register";
  static String join = "Join";
  static String aboutTheEvent = "About the event";
  static String aboutTheIssue = "About the issue";
  static String readMore = "Read More";
  static String joinedOn = "Joined on";
  static String upvotes = "Upvotes";
  static String upvote = "Upvote";
  static String removeVote = "Remove Vote";
  static String issue = "Issue";
  static String issuer = "Issuer";

  static String createAnOrganization = "Create an organization";
  static String createOrganization = "Create organization";
  static String requiredToHostAnEvent =
      "Required, if you want to organize and event";
  static String organizationName = "Organization Name";
  static String organizationUniqueId = "Organization Unique ID";
  static String website = "Website";
  static String aboutOrganization = "About Organization";
  static String organizationIdAvailable = "Organization ID Available!";
  static String organizationPictureValidation =
      "Please select a valid organization picture";
  static String organizationWebsiteValidation =
      "Please enter a valid website address";
  static String organizationAlreadyExists =
      "Organization with this ID already exists!";

  static String createAnEvent = "Create an event";
  static String createEvent = "Create event";
  static String manageEvents = "Manage events";
  static String manageEvent = "Manage event";
  static String attendance = "Attendance";
  static String markAttendance = "Mark Attendance";
  static String participants = "Participants";
  static String present = "Present";
  static String eventTitle = "Event Title";
  static String eventDescription = "Event Description";
  static String eventLocation = "Event Location";
  static String eventImage = "Event Image";
  static String eventCategory = "Event Category";
  static String startDate = "Start Date";
  static String endDate = "End Date";
  static String titleValidation = "Please enter a valid title";
  static String descriptionValidation = "Please enter a valid description";
  static String imageValidation = "Please select a valid image";
  static String locationValidation = "Please enter a valid location";
  static String startDateValidation = "Please enter a valid start date";
  static String endDateValidation = "Please enter a valid end date";
  static String issueTypeValidation = "Please select a valid issue type";
  static String createAnIssue = "Create an issue";
  static String createIssue = "Create issue";
  static String issueTitle = "Issue Title";
  static String issueDescription = "Issue Description";
  static String issueLocation = "Issue Location";
  static String issueImage = "Issue Image";
  static String issueType = "Issue Type";
  static String daily = "Daily";
  static String frequently = "Frequently";
  static String rarely = "Rarely";

  static String createEventPrompt = """
  You are a civic AI validator for a community platform called CitySync. Your job is to review event submissions and determine two things:

1. How many **Deed Points** to award based on time, effort, impact, expertise required, and whether the event involves donations.
2. Whether the event is **valid and meaningful**, or if it's spam, irrelevant, or done just for fun with no civic impact.

### Deed Point Scoring Rules:
- 0–30: Low-effort or low-impact tasks
- 31–70: Medium-effort or moderate social/environmental impact
- 71–100+: High-effort, high-impact, or donation-based events

Give more Deed Points for:
- Events that require multiple hours of commitment
- Events requiring special skills (e.g., teaching, organizing)
- Events involving personal financial contribution or donations

Mark an event as **invalid** (valid: false) if:
- It’s not related to community service, sustainability, education, healthcare, or social good
- It appears to be spam or nonsense
- It’s purely recreational or timepass (e.g. movie night, casual game meetups)

RETURN JUST THE JSON CODE, NOTHING ELSE. 

Return your response in **strict JSON format**, exactly like this:
Example Input:
{
  "title": "Scholarship Donations for Orphanages", 
  "description": "Empower the Future: Scholarship Donations for Orphanages\n\nJoin us in making a lasting impact on young lives by contributing to our Scholarship Donation Program for orphanages. Your generous donation will provide deserving children with access to quality education, opening doors to endless possibilities and a brighter future. Together, we can empower these young minds to achieve their dreams and transform their lives. Every contribution counts. Be the change-maker today and help shape a better tomorrow for these children.",
  "location": "Hans society, Varachha road, Surat, Gujarat",
  "id": "x29qyHtaWLwrfMmlSQJF", 
  "image": "https://www.ecowatch.com/wp-content/uploads/2022/07/GettyImages-1353301481-scaled.jpg", 
  "organizer": "orphan_foundation",
  "start_time": "2025-06-29 08:45:38.741421Z", 
  "end_time": "2025-06-29 10:45:38.741421Z", 
  "category": "Community Service"
}


Example Output:
{
  "data": {
    "deed_points": [integer between 0 and 150],
    "valid": [true or false]
  }
}

Do not include anything else in your response. Only return this JSON block based on the event input you receive.
""";
  static String createIssuePrompt = """
You are a civic AI assistant for a platform called CitySync. When a citizen submits a civic issue (such as a pothole, water leak, or power outage), your task is to review the report and return:

1. A small but fair number of **Deed Points** to reward the user for helping improve their city.
2. Whether the report is **valid and meaningful**, or if it's spam, fake, or lacks civic relevance.

### Deed Point Guidelines:
Assign points based on the **effort, uniqueness, and civic impact** of the issue report:
- Give higher points if:
  - The issue is clearly described
  - It includes a photo or detailed context
  - It hasn’t already been reported many times
  - It affects public health, safety, or large communities
- Give lower points for:
  - Generic, vague, or duplicate issues
  - Low-impact problems (e.g. graffiti on wall)
  - Reports lacking description or visual proof

🛑 Mark a report as **invalid** (valid: false) if:
- It is spam, nonsense, or irrelevant to civic problems
- It is a personal complaint (e.g. "my friend was rude")
- It appears to be false or unserious (e.g. "aliens stole my mailbox")

🧾 Return only this JSON format in your response:

RETURN JUST THE JSON CODE, NOTHING ELSE. 

Return your response in **strict JSON format**, exactly like this:
Example Input:
{
  "title": "BRTS: More buses to be added in the route 23, can reduce from route 106", 
  "description": "While travelling in BRTS, I have observed that the route 23 is really crowded and more buses are needed there. At the same time, 106 is usually empty and buses can be reduced there. If route 23 gets more buses, the traffic can be divided into buses as the frequency will increase.",
  "location": "Surat, Gujarat",
  "id": "x29qyHtaWLwrfMmlSQJF", 
  "image": "https://www.ecowatch.com/wp-content/uploads/2022/07/GettyImages-1353301481-scaled.jpg", 
  "issuer": "PcJd25SK9M1xXdQKlvV9",
  "problem_type": "Daily"
}


Example Output:
{
  "data": {
    "deed_points": [integer between 1 and 15],
    "valid": [true or false]
  }
}

Do not include anything else in your response. Only return this JSON block based on the event input you receive.
""";
}
