## 프로젝트 설명

일상에 대한 자연스러운 질문과 대화 루틴을 통해 기분 장애를 예방하고 건강한 마음을 가꿔나갈 수 있도록 돕는 모바일 서비스입니다.

매일 정해진 시간에 대화 메이트가 전화를 걸어오고 ‘오늘 하루 어땠어요?’라는 주제로 3분간 대화를 나누는 서비스입니다.

## 기술 스택

- MVVM + Coordinator
- RxSwift, SnapKit, Moya, Aogra
- Fastlane
- Figma, Slack, Notion

## 화면별 설명

<details>
    <summary>스플래시</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208905375-8da90f85-d842-4d87-8d17-2756f54b05dd.png" width=150 height=266>
    <ul>
        <li>로그인은 애플로그인 하나만 제공합니다.</li>
        <li>애플로그인을 성공하면 받은 토큰을 서버로 보내면, 서버에서 해당 토큰으로 애플에 검증 후 액세스 토큰을 발급받아 다시 리턴해줍니다. 해당 액세스토큰으로 서버와의 통신을 합니다.</li>
        <li>게스트로 둘로보기로 들어가면 큰 기능이 불가능한데 굳이 넣은 이유는 애플의 앱 리젝사유중 단순 로그인 기능으로 사용하는데 애플로그인 하나만 있으면 안된다고 앱을 둘러볼 수 있는 다른 방법이 필요하다해 추가했습니다.</li>
    </ul>
</details>

<details>
    <summary>가입화면-1</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208905980-af5d63e6-7a40-4660-a876-1b07c4e18c45.png" width=150 height=266>
    <ul>
        <li>애플로그인 시 가입한 정보가 없다면 나타나는 가입화면입니다.</li>
        <li>성별, 연령대, 하는일, 소개글에 대한 입력을 받습니다.</li>
        <li>소개글을 제외한 모든값을 입력하면 다음 버튼이 활성화됩니다.</li>
    </ul>
</details>

<details>
    <summary>가입화면-2</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208906107-53dc86c6-1a50-48d4-8fa0-1ab59843a539.png" width=150 height=266>
    <img src="https://user-images.githubusercontent.com/59193640/208906322-dad00d25-104f-4656-980d-f34bbd70dae1.png" width=150 height=266>
    <ul>
        <li>프로필 이미지를 선택할 수 있습니다. 총 아홉가지 프로필을 저희쪽에서 제공하며 서버와는 단순 코드로 싱크를 맞춰 사용합니다.</li>
        <li>프로필 이미지 선택, 닉네임 중복 확인이 되지 않으면 다음버튼이 활성화 되지 않습니다.</li>
        <li>중복확인은 서버를 통해 확인하고 응답받습니다.</li>
        <li>중복확인 된 상태에서도 닉네임이 변경되면 바로 버튼이 비활성화 됩니다.</li>
    </ul>
</details>

<details>
    <summary>리스너스피커 매칭</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208906491-5fcf7c25-1adb-49af-8661-427802ecc9bb.png" width=150 height=266>
    <ul>
        <li>스피커가 리스너와의 매칭을 신청하는 화면입니다.</li>
        <li>화면의 모든 내용을 입력해야 신청이 가능합니다.</li>
        <li>신청내용을 토대로 가장 가까운 리스너를 매칭시켜줍니다.</li>
        <li>가입화면과 비슷한 뷰들이 보인다면 전부 디자인시스템으로 구현됐고 재사용됐습니다.</li>
    </ul>
</details>

<details>
    <summary>메인화면-스피커</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208906624-7702f3fc-b7e4-4d42-99e0-3f07f15c310e.png" width=150 height=266>
    <ul>
        <li>리스너가 매칭된 후 스피커의 화면입니다.</li>
        <li>현재 매칭된 리스너를 보여줍니다.</li>
        <li>일주일간의 대화 기록, 대화 기간, 대화 시간 등을 보여줍니다.</li>
        <li>대화미루기 기능을 통해 하루 대화를 미룰 수 있습니다.</li>
    </ul>
</details>

<details>
    <summary>메인화면-리스너</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208906862-4120f3e5-717a-4e58-853f-f1c6b3cfb2c9.png" width=150 height=266>
    <ul>
        <li>리스너의 메인화면입니다.</li>
        <li>현재 매칭된 스피커들의 리스트를 보여줍니다.</li>
        <li>현재 진행중인 대화만 표시되고 이미 지난 대화는 대화기록탭에 표시됩니다.</li>
        <li>전화걸기 버튼을 통해 정해진 시간에 스피커에게 전화를 걸 수 있습니다.</li>
        <li>전화 걸기 버튼을 누르면 FCM을통해 스피커에게 푸시가 발송되고, 스피커가 해당 푸시를 받은 후 앱에 들어오면 자동으로 전화 연결이 진행됩니다.</li>
    </ul>
</details>

<details>
    <summary>대화기록</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208906945-eed074b7-1028-42da-8ca9-733ffc0fc949.png" width=150 height=266>
    <ul>
        <li>대화기록 화면입니다.</li>
        <li>리스너 스피커 구분없이 이미 지난 대화에 대한 기록을 확인할 수 있습니다.</li>
        <li></li>
    </ul>
</details>

<details>
    <summary>통화연결</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208907026-b7729fb4-1262-4906-8bb1-6712387cbcff.png" width=150 height=266>
    <ul>
        <li>현재 통화중인 상대방, 시간 등의 정보를 확인할 수 있습니다.</li>
        <li>Agora SDK를 활용하여 통화기능을 구현했습니다.</li>
        <li>통화 연결 로직은 아래와 같습니다<ol>
        <li>리스너가 스피커에게 통화를 건다 - 소켓 연결 및 푸시발송</li>
        <li>스피커가 푸시를 받은 후 통화를 받는다 - 소켓 연결</li>
        <li>소켓룸에 리스너와 스피커가 들어온경우 두 유저에게 FCM으로 AgoraChannel에 입장가능한 토큰을 보낸다</li>
        <li>토큰을 받은 두 유저는 통화 연결에 성공한다.</li></ol>
        <li>가장 아쉬운점은 소켓 양방향 통신 구현이 안돼 이를 FCM으로 대체해 불필요한 코드가 더 생긴 점이다.</li>
    </ul>
</details> 

## 담당

- 프로젝트 아키텍쳐 MVVM + Coordinator 구조로 설계
- SocketIO를 사용한 WebSocket 통신 설계 및 구현
- Moya를 사용한 RestAPI 통신 설계 및 구현
- 로그인 및 회원가입 파트 구현
- 디자인시스템 정의 및 구현
- 통화 시스템 구현

## 성과

- 서비스의 기획단계부터 개발 완료 배포까지 전 과정을 경험함
- 프로젝트의 아키텍쳐(MVVM+C)를 직접 설계 및 구현함
- 디자이너님들과 직접 소통하며 DesignSystem 컴포넌트들을 정의하고, 위치만 신경쓰면 화면을 쉽게 구성할 수 있도록 구현해 생산성을 크게 향상함
- 아이폰의 밀어서 종료하기 버튼 구현 요청이 들어와 해당 기능을 구현하고 라이브러리가 없는것으로 확인돼 CocoaPods에 업로드함
- PR을 통한 코드리뷰를 진행했고, 코드의 가독성과 퀄리티가 높아짐

## **회고**

- 처음으로 팀 프로젝트를 진행하면서 의사소통의 중요성을 깨달았습니다. 내가 당연하다고 생각하는 것은 상대방에게 당연하지 않을 가능성이 컸고, 통화 서비스를 구현하는 중 소켓 통신에 대해 클라이언트는 당연하게 양방향 통신을 생각했고, 백엔드는 단방향통신을 생각함으로써 개발 막바지에 이르러 문제가 발생해 일정에 차질이 생길뻔했습니다. 협업에는 깊은 의사소통이 중요하다는 것을 크게 깨달았던 프로젝트입니다.
    - **당장 양방향 통신 구현이 어렵다고 판단돼 이미 구현돼 있던 FCM을 통해 실시간 통신을 하는 것처럼 구현했습니다. 클라이언트→소켓→서버→FCM→클라이언트 구조로 구현했습니다.**
- 현업에서는 코드리뷰를 따로 진행하지 않는데 사이드 프로젝트를 통해 코드리뷰를 진행했고, 내 코드가 상대방에게 어떻게 보일지를 좀 더 고민하게 되고 더 발전할 수 있는 좋은 경험이었습니다.
- 기획팀부터 개발팀까지 잘 구성된 팀으로 협업을 진행하다 보니 비개발직군과 소통할 일이 많았고 프로젝트가 진행됨에 따라 비개발직군에게 개발에 관해 설명하는 역량이 늘어남을 느꼈습니다.
- 팀원들에게 받은 칭찬입니다.   
![Untitled](https://user-images.githubusercontent.com/59193640/208907965-7f224555-e1f3-4063-a657-477a5a47c79f.png)

## Link

### AppStore

[AppStore](https://apps.apple.com/kr/app/id1641642480)
