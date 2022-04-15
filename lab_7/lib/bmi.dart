class BMI {
  String gender = '';
  int height = 130, weight = 52, age = 18;
  get calculate {
    return (weight / height / height) * 10000;
  }
}
