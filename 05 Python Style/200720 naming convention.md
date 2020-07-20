python에서 naming convention

기본적으로 low case 사용, + under score

ST(single telling) underscore

SL(single leading)

DL

DLT

# OOP (Object Oriented Programming)

파이썬은 철저하게 객체지향 -> 재사용성 유익

목적에 맞게 강한 의존성 또는 결합의 Attribute와 Method를 Class로 묶고, Object 외부로부터 변경을 최소화하여 수정을 유연하게 함

- Class: 같은 종류에 속하는 attribute과 behavior를 정의
- Object: Class의 인스턴스(메모리 상에 할당된 상태)
- Attribute: Class의 변수(상태)
- Method: Class의 함수(메세지)
- [PEP8] Class 이름은 CapWords 규칙

Class = Attribute(속성) + Method(기능)



``` python
class Dog:
    def __init__(self, name_):  # constructor
        self.name = name_       # Attribute
        self.direction = "stop" # Attribute
        
    def go_to(self, dir_):    # method
        self.direction = dir_
    
    def __str__(self):    # for print
        return self.name + " " + self.direction

my_puppy = Dog("puppy")
# 메모리에 얹음. 얹어져 있는 상태 = Object
my_puppy.go_to("go head")
print(my_puppy)
```

객체와 클래스

- Class: 보조기억장치의 **파일**로 저장된 상태
- Object: **메모리** 상에 할당되어 고유 메모리주소에 저장된 상태



Dog 전체의 초기화되기 전 상태의 object(메모리에 올라가있는 상태) -> self

그 뒤 파라미터 -> _name

파이썬이 알아서 초기화된 것을 my_puppy에 넘겨줌

`def __init__` : 생성자

`def go_to` : method

하나의 클래스: 사각형. 1구획: class name, 2구획: 초기화하는 attribute, 3구획: method name

클래스가 아닌 실행 중인 object: 클래스 이름에 밑줄.



## Constructor

- `__init__()`
  - 객체가 생성된 후 가장 먼저 호출되는 메소드로 "생성자 Constructor"라고도 함
  - "초기화하다"는 의미 initialize를 줄여진 명칭으로  특수목적 함수 (예약어)
  - [PEP8] Class의 인스턴스 메소드의 첫번째 Parameter이름은 "self" 사용

- Method
  - Instance Method의 두번째 Parameter부터 호출 Argument와 대응

Clsss와 function은 완전 달라.

- Naming Convention
  - [PEP8] Attribute: 변수명칭규칙을 따르고, Naming collision은 single trailing underscore 사용
  - [PEP8] Method: 모두 소문자를 사용하고, 여러 단어인 경우 underscore로 분리
- Accessor(접근자): 접근 제어
  - (+) public: 외부에서 접근 가능, leading underscored 없는 이름
  - [PEP8] (#) non-public: 외부에서 접근은 불가, one leading underscore(_) 사용