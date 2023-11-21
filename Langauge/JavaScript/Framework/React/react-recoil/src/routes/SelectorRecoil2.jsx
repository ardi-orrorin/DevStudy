import styles from "../scss/pages/_atom.module.scss";
import {useRecoilState} from "recoil";
import {testSelector} from "./SelectorRecoil";
import {useEffect} from "react";

export default function SelectorRecoil2() {

    const [readStrSelector, setReadStrSelector ] = useRecoilState(testSelector);
    const {str, list} = readStrSelector;

    useEffect(() => {
        console.log(str,list)
    })

    function onSetChangeHandler(e) {
        // 변경 내용이 하나 일지라도 selector가 다시 실행되기 때문에 의존성이 다른 값도 같이 넣어줘야 한다.
        setReadStrSelector({str: e.target.value, list: [...list]})
    }
    function onClickAddHandler() {
        setReadStrSelector({str: str, list: [...list, '']})
    }
    function onClickSubHandler() {
        setReadStrSelector({str: str, list: [...list.slice(0, list.length - 1)]})
    }

    return (
        <div className={styles.container}>
            <div style={{margin:'10px 0'}}>
                <h1 style={{fontSize:'1.2rem', fontWeight: 700}}>readStrSelector : {str}</h1>
            </div>
            <div>
                <label>readStrSelector : </label>
                <input onChange={onSetChangeHandler} value={str} />
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