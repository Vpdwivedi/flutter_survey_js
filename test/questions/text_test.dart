import 'package:flutter_survey_js/model/survey.dart';
import 'package:flutter_survey_js/ui/elements/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  // 单一的测试
  const json = {
    "questions": [
      {
        "name": "name",
        "type": "text",
        "state": "expanded",
        "title": "Please enter your name:"
      },
      {
        "name": "price",
        "type": "text",
        "inputType": "number",
        "title": "Please enter price"
      },
      {
        "name": "birthdate",
        "type": "text",
        "inputType": "date",
        "title": "Your birthdate:"
      },
      {
        "name": "color",
        "type": "text",
        "inputType": "color",
        "title": "Your favorite color:"
      },
      {
        "name": "email",
        "type": "text",
        "inputType": "email",
        "title": "Your e-mail:",
        "isRequired": true,
        "validators": [
          {"type": "email"}
        ]
      },
      {
        "name": "datetime",
        "type": "text",
        "inputType": "datetime",
        "title": "Your lunch time:"
      },
      {
        "name": "datetime-local",
        "type": "text",
        "inputType": "datetime-local",
        "title": "Your supper time:"
      },
      {
        "name": "month",
        "type": "text",
        "inputType": "month",
        "title": "Your favorite month:"
      },
      {
        "name": "password",
        "type": "text",
        "inputType": "password",
        "title": "Please enter password:"
      },
      {
        "name": "range",
        "type": "text",
        "inputType": "range",
        "title": "Please set price range:"
      },
      {
        "name": "tel",
        "type": "text",
        "inputType": "tel",
        "title": "Enter your phone number"
      },
      {
        "name": "time",
        "type": "text",
        "inputType": "time",
        "title": "When do you watch TV?"
      },
      {
        "name": "url",
        "type": "text",
        "inputType": "url",
        "title": "Add link to your site please"
      },
      {
        "name": "week",
        "type": "text",
        "inputType": "week",
        "title": "Mark any week which you want"
      }
    ]
  };
  test("Serialize Deserialize Survey", () {
    final s = Survey.fromJson(json);
  });

  group("textControlBuilder", () {
    test(
        "returns validator when inputType is null, validators is null, but isRequired is true",
        () {
      final Object? formControl = textControlBuilder(
        Text()
          ..inputType = null
          ..validators = null
          ..isRequired = true,
      );
      expect(formControl is FormControl, isTrue);
      expect((formControl as FormControl).validators.isNotEmpty, isTrue);
    });

    test(
        "does not return validator when inputType is null, validators is null, and isRequired is false",
        () {
      final Object? formControl = textControlBuilder(
        Text()
          ..inputType = null
          ..validators = null
          ..isRequired = false,
      );
      expect(formControl is FormControl, isTrue);
      expect((formControl as FormControl).validators.isEmpty, isTrue);
    });
  });
}
