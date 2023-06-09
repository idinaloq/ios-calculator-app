# 🧮계산기

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [타임라인](#-타임라인)
5. [트러블 슈팅](#-트러블-슈팅)
6. [회고](#-회고)

---

## 🍀 소개

`idinaloq`가 만든 만든 계산기 프로젝트 입니다.
- 계산기는 수식을 계산하고 결과를 화면에 나타냅니다.

---

## 👨‍💻 팀원

| idinaloq |
| :---: |
| <Img src = "https://user-images.githubusercontent.com/109963294/235301015-b81055d2-8618-433c-b680-58b6a38047d9.png" width = "250" height="300"/> |
| [Github Profile](https://github.com/idinaloq) | 

---

## 👀 시각화된 프로젝트 구조

| 계산기 |
|:--:|
|<img src="https://github.com/idinaloq/testRep/assets/124647187/3f91d24c-284d-419a-9d16-55a272401ca6" height="600" width="600">|


---

## 🕰️ 타임라인 

| 날짜 | 내용 |
| :---: | --- |
| 2023.05.29 | Node 구현 |
| 2023.05.30 | LinkedList, CalculateItemQueue 구현 |
| 2023.05.31 | LinkedList의 메서드 네이밍, 로직변경 |
| 2023.06.01 | 제네릭타입 네이밍 변경, 접근제어자 변경 |
| 2023.06.02 | Operator 구현 |
| 2023.06.04 | extension String의 split메서드 구현 |
| 2023.06.05 | ExpressionParser 임시 작성, 전반적인 리팩토링 |
| 2023.06.06 | parse메서드, result메서드 구현 |
| 2023.06.07 | 전반적인 코드 리팩토링(불필요한 코드, 네이밍) |
| 2023.06.08 | result메서드, parse메서드 알고리즘 변경 |

---

## ✍️ 트러블 슈팅

## 접근 권한 
### 문제점

- TDD를 진행할 때, private 등으로 접근 제한이 걸려있는 경우 접근할 수 없는 문제가 있었고, 이를 해결하기 위해 보통 접근제어 레벨을 변경하도록 사용했습니다.
```swift
private var list: LinkedList<Element> = LinkedList() 
```

### 해결방법
- 첫 번째 해결방법으로는 테스트코드에 extension을 추가하는 방법이 있었고, 두 번째로는 연산프로퍼티를 사용해서 캡슐화를 하는 방법이 있었습니다.
- 첫 번째 방법을 사용했었는데, 이 방법보다는 두 번째 방법을 사용을 다음과 같이 사용했습니다.
```swift
    var currentList: LinkedList<Element> {
        return list
    }
```

## 수식 계산문제
### 문제점
- 하나씩 dequeue를 하고, 이 값을 계산해서 result를 반환하는 코드를 다음과 같이 작성했습니다.
```swift
var result: Double = 0

        while !(isEmptyOperators || isEmptyOperands) {
            var lhs: Double = result

            guard let rhs: Double = operands.dequeue() else {
                return 0
            }

            guard let operation: Operator = operators.dequeue() else {
                return 0
            }

            result = operation.calculate(lhs: lhs, rhs: rhs)
```
- lhs에는 result가 계속 할당이되고, rhs를 한 번씩 가져와서 결과적으로는 계속 연산이 이루어지도록 하였는데, 언뜻 보면 맞다고 생각되지만, 첫 번째 operand를 가져오는것이 아닌 0부터 시작을 해서 operator가 하나씩 밀리는 문제가 있었습니다.
- 가령 1+2-3이라는 식이 있다면, 실제로는 0+1-2 와 같이 동작을 했습니다.

### 해결방법
- 기존의 중복되는 코드를 줄이고, 처음의 lhs가 0이 아닌, lhs값을 가져오도록 수정을 진행하였습니다.
- while 조건문에서 이미 조건을 만족하는데, guard let 구문에서 이미 만족한 조건을 옵셔널 바인딩을 위해 검사를 해서 해당부분을 while let으로 변경하였습니다.
```swift
guard let firstLhs: Double = operands.dequeue() else {
            return 0
        }
        
        var result: Double = firstLhs
        var lhs: Double = 0
        
        while let rhs: Double = operands.dequeue(),
              let operation: Operator = operators.dequeue() {
            lhs = result
            result = operation.calculate(lhs: lhs, rhs: rhs)
        }
```


---


## 회고

## 잘한 점
- 제시된 조건에 맞게, 별도의 기능을 추가하지 않고 기능을 구현한 것이라고 생각합니다.
## 개선할 점
- STEP2를 진행할 때 TDD를 하지 않았는데, 오히려 TDD를 했으면 좀 더 빨리 프로젝트를 수행할 수 있었다고 생각합니다.
## 좋았던 점
- 기존에는 팀 프로젝트를 하다가 혼자 진행하게 되니 시간에 여유가 생기고 정신적으로 몰리지 않았다고 생각합니다.
## 아쉬웠던 점
- 시간에 여유가 생기다보니 점점 집중하는 시간이 짧아지고 결국 STEP3를 완료하지 못했습니다.