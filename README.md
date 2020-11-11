# FlutterCourses
Courses Flutter Framework 9-13 November By.อาจารย์เอก

ExampleCodeDart.txt : พื้นฐานภาษา Dart


PERMISSION Path
flutterapp\android\app\src\main\AndroidManifest.xml
<uses-permission android:name="android.permission.INTERNET" />

---------Web Libary-----
https://pub.dev/packages/
--add
    --Libary HTTP
    --http: ^0.12.2

---เว็บแปลง json -> dart เพื่อสร้าง model
https://javiercbk.github.io/json_to_dart/

--json
{
    "data": [
        {
            "id": 1,
            "title": "HTML 5",
            "detail": "พัฒนาเว็บไซต์ด้วย HTML 5",
            "date": "2014-10-12",
            "view": 47889,
            "picture": "https://api.codingthailand.com/storage/images/course/1.png"
        },
        {
            "id": 2,
            "title": "CSS 3",
            "detail": "พัฒนาและตกแต่งเว็บไซต์ด้วย CSS",
            "date": "2014-10-14",
            "view": 24236,
            "picture": "https://api.codingthailand.com/storage/images/course/2.png"
        },
    ],
    "meta": {
        "status": "success",
        "status_code": 200
    }
}

