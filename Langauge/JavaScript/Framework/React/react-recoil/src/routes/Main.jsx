import styles from '../scss/pages/_main.module.scss'
import styleInput from '../scss/components/_textInput.module.scss';
import {useRecoilState, useRecoilValue, useSetRecoilState} from "recoil";
import {testSelector, testSelector2, testStrState} from "../stores/test";

export default function Main() {

    const testStr = useRecoilState(testStrState)
    console.log(testStr)

    return (
        <div className={styles.container}>
            <InputTestStr />
            <Selector />
            <SelectorList />
            <br />
            <h1 className={styles.headText}>{testStr}</h1>
        </div>
    )
}

function InputTestStr() {
    const setTestStr = useSetRecoilState(testStrState)
    const onChange = (e) => {
        setTestStr(e.target.value)
    }
    return (
        <>
            <input className={styleInput.input} onChange={onChange}/>
        </>
    )

}

function Selector(){
    const testSelectorRecoil = useRecoilValue(testSelector);
    console.log(testSelectorRecoil)
    return (
        <>
            <input className={styleInput.input}/>
        </>
    )
}
function SelectorList() {
    const {testList, testLength} = useRecoilValue(testSelector2);
    console.log(testList, testLength)
    return (
        <>
            <input className={styleInput.input}/>
        </>
    )

}