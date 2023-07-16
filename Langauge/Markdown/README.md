# 1. FontSize
# `#제목`
## `##제목`
### `###제목`
#### `####제목`
##### `#####제목`

제목  

## 2-1. 들여쓰기
`<pre><code>코드 내용</code></pre>`
<pre>
<code>
public class SpringBoot(){
    public static void main(String[] args){
        system.out.println("hello World");
    }
}  
</code>
</pre>

## 2-2. 들여쓰기
`공백 4개 입력 후 코드 내용`    

    public class SpringBoot(){
        public static void main(String[] args){
            system.out.println("hello World");
        }
    }


## 3.BockQuote (인용)
> `>텍스트 1  `
>> `>>텍스트 2`
>>> `>>>텍스트 3`

## 4.줄바꿈
`스페이스바 2번(공백 2자리) OR <br> 태그 사용`  

`줄바꾸기`  
`줄바꾸기<br>`<br> 


## 5-1. 순서 있는 목록
1. 첫번째
2. 두번째
3. 세번째
   1. 들여쓰기 첫번째
   2. 들여쓰기 두번째
4. 네번째
   
## 5-2. 순서 없는 목록
`글머리 기호 : *, + -`
* `* 첫번째`
  * `* 두번째`

+ `+ 첫번째`
  + `+ 두번째`
    + `+ 세번째`

- `- 첫번째`
  - `- 두번째`
    - `- 세번째`
      - `- 네번째`


## 6. 수평선
`<hr/>`   
수평선 시작
<hr/>
수평선 끝


## 1. Link
* `외부 링크`   
사용문법 `(텍스트)[링크주소]`   
[github](https://github.com)  
* 참조 링크   
사용문법    
`[텍스트][변수]`<br><br>
`[변수]: URL "설명"`   
[깃허브][githublink]

[githublink]: https://github.com "git-hub"

* 자동 연결   
일반적으로 이메일주와 같은 경우 사용  
`외부 링크 : URL`  
`외부 링크 : 이메일주소`  
외부 링크 : https://github.com  
이메일 링크 : github@github.com


## 2. Image
![설명](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/GitHub_Invertocat_Logo.svg/200px-GitHub_Invertocat_Logo.svg.png)  
`![설명](링크)`