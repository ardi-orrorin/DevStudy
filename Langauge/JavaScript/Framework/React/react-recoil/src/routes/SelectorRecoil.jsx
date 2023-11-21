import styles from "../scss/pages/_atom.module.scss";
import {atom, selector, useRecoilState, useRecoilValue, useSetRecoilState} from "recoil";
import {testSelector2} from "../stores/test";
import {useEffect} from "react";

// atom은 하나의 상태를 관리하는 것이다.
export const strAtom = atom({
    key: 'strAtomSelector',
    default: 'default str'
});


// selector 안에 의존성을 갖인 atom을 넣으면 하나라도 변경되면 selector가 다시 실행된다.
export const listAtom = atom({
    key: 'listAtomSelector',
    default: [],
});


export const testSelector = selector({
    key: 'testSelector',
    get: ({get}) => {
        const str = get(strAtom);
        const list = get(listAtom);
        return {str, list}
    },
    set: ({set}, {str: strValue, list: listValue}) => {
        set(strAtom, strValue);
        set(listAtom, listValue);
    }
})

export default function SelectorRecoil() {
    const {str ,list } = useRecoilValue(testSelector);
    const setRecoilState = useSetRecoilState(testSelector)

    useEffect(() => {
        console.log(str, list)
    })

    function onSetChangeHandler(e) {
        // 변경 내용이 하나 일지라도 selector가 다시 실행되기 때문에 의존성이 다른 값도 같이 넣어줘야 한다.
        setRecoilState({str: e.target.value, list: [...list]})
    }
    function onClickAddHandler() {
        setRecoilState({str: str, list: [...list, '']})
    }
    function onClickSubHandler() {
        setRecoilState({str: str, list: [...list.slice(0, list.length - 1)]})
    }

    return (
        <div className={styles.container}>
            <div style={{margin:'10px 0'}}>
                <h1 style={{fontSize:'1.2rem', fontWeight: 700}}>strSelector : {str}</h1>
                <h1 style={{fontSize:'1.2rem', fontWeight: 700}}>strSelector : {list.length}</h1>
            </div>
            <div>
                <label>readStr : </label>
                <input onChange={onSetChangeHandler} value={str}/>
            </div>
            <div>
                <label>readStrAtom : </label>
                <input value={str} />
            </div>
            <div>
                <label>ListLength : {list.length}</label>
                <input type={"button"} onClick={onClickAddHandler} value={'+'}/>
                <input type={"button"} onClick={onClickSubHandler} value={'-'}/>
                <div style={{display: "block"}}>
                    {
                        list.map((item, index) => (
                            <div key={index} style={{width:30, height:30,margin:"0 5px", backgroundColor:'blue', display: "inline-block"}} >
                            </div>
                        ))
                    }
                </div>
            </div>
        </div>
    )
}

