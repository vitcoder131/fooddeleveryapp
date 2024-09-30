class UnboardingContent{
  String image;
  String title;
  String description;
  UnboardingContent({required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
    description: 'Pick your food our menu\n        More than 35 times', 
    image: "images/sceen1.png", 
    title: 'Select from our\n     Best Menu'),
    UnboardingContent(description: 'You can pay Cash on delivery and\n      Card payment is available', 
    image: "images/sceen2.png", 
    title: 'Easy and Online Paymment'),
    UnboardingContent(description: 'Deliver your food at your\n       Doorstep', 
    image: "images/screen3.png", 
    title: 'Quick Delivery at your Doorstep'),
];