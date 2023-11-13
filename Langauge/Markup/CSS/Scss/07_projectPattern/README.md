 # 프로젝트 구조 패턴

Sass는 기본적으로 상황에 맞게 파일들을 나눈다.

- base 기본 태그, 프로젝트 전역에 필요한 스타일
- components 컴포넌트의 내용
- layout 사이트 구조 내용
- pages 페이지 내용
- themes 테마 관련된 내용
- abstracts 주로 변수및 추상화된 내용
- vendors 외부 라이브러리 및 프레임워크의 내용
- main 하위의 모든 scss import한다


### 1. abstracts
- _variables.scss
- _mixins.scss
- _functions.scss
- _placeholers.scss

추상화된 스타일로 전역에서 사용될 함수, 믹스인 변수의 내용을 담고 있다.


### 2. venders
- _bootstrap.scss
- _jquery-ui.scss

외부 라이브러리 및 프레임워크의 스타일을 재정의해서 사용해야 할 경우

### 3. bases
- _base.scss html el, body 등 기본값 내용
- _reset.scss html el 초기화
- _typography.scss 폰트
- _animation.scss 애니메이션 스타일

프로젝트 전반에 사용될 폰트 기본 스타일을 정의한다.


### 4. layouts
- _grid.scss
- _header.scss
- _footer.scss
- _sidebar.scss
- _forms.scss
  
프로젝트이 레이아웃 구조에 해당하는 스타일을 정의

### 5. components
- _buttons.scss
- _media.scs
- _carousel.scss
- _thumnails.scss
  
컴포넌트 스타일을 정의

### 6. pages
- _home.scss
- _contact.scss
- _about.scss
- _singin.scss

페이지의 고유 스타일을 정의

### 7. themes
- _dark.scss
- _white.scss

사이트의 전체적으로 테마 스타일을 정의

### 8. mai.scss
모든 scss의 연결하는 파일

```scss
// 파일별 import
@import 'abstracts/variables'
@import 'abstracts/mixins'
@import 'abstracts/functions'
@import 'abstracts/placeholers'

@import 'venders/bootstrap'
@import 'venders/jquery-ui'

@import 'bases/base'
@import 'bases/reset'
@import 'bases/typography'
@import 'bases/animation'

@import 'layouts/grid'
@import 'layouts/header'
@import 'layouts/footer'
@import 'layouts/sidebar'
@import 'layouts/forms'

@import 'components/buttons'
@import 'components/media'
@import 'components/carousel'
@import 'components/thumnails'

@import 'pages/home'
@import 'pages/contact'
@import 'pages/about'
@import 'pages/singin'

@import 'themes/dark'
@import 'themes/white'
```

```scss
// 폴더 별 import 묶음
@import
  'abstracts/variables',
  'abstracts/functions',
  'abstracts/mixins',
  'abstracts/placeholders';

@import
  'vendors/bootstrap',
  'vendors/jquery-ui';

@import
  'base/reset',
  'base/typography';

@import
  'layout/navigation',
  'layout/grid',
  'layout/header',
  'layout/footer',
  'layout/sidebar',
  'layout/forms';

@import
  'components/buttons',
  'components/carousel',
  'components/cover',
  'components/dropdown';

@import
  'pages/home',
  'pages/contact';

@import
  'themes/theme',
  'themes/admin';
```

```scss
// 폴더별 import
@import 'abstracts/*';
@import 'vendors/*';
@import 'base/*';
@import 'layout/*';
@import 'components/*';
@import 'pages/*';
@import 'themes/*';
```


```scss
// 한번에 @import
@import 'scss'
```