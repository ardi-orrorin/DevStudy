import styles from '../scss/pages/_atom.module.scss'
import {atom, useRecoilState, useRecoilValue, useSetRecoilState} from "recoil";

// atom은 하나의 상태를 관리하는 것이다.
export const strAtom = atom({
    key: 'strAtom',
    default: 'default str'
});

export const listAtom = atom({
    key: 'listAtom',
    default: [],
});

export default function Atom() {
    const readStr = useRecoilValue(strAtom);
    const setReadStr = useSetRecoilState(strAtom)
    const [readStrAtom, setReadStrAtom ] = useRecoilState(strAtom);
    const [readListAtom, setReadListAtom] = useRecoilState(listAtom);

    function onSetChangeHandler(e) {
        setReadStr(e.target.value)
    }

    function onStateChangeHandler(e) {
        setReadStrAtom(e.target.value)
    }
    function onClickAddHandler() {
        setReadListAtom([...readListAtom, ''])
    }
    function onClickSubHandler() {
        setReadListAtom([...readListAtom.slice(0, readListAtom.length - 1)])
    }

    return (
        <div className={styles.container}>
            <div style={{margin:'10px 0'}}>
                <h1 style={{fontSize:'1.2rem', fontWeight: 700}}>strAtom : {readStr}</h1>
            </div>
            <div>
                <label>readStr : </label>
                <input onChange={onSetChangeHandler} value={readStr}/>
            </div>
            <div>
                <label>readStrAtom : </label>
                <input onChange={onStateChangeHandler} value={readStrAtom} />
            </div>
            <div>
                <label>ListLength : {readListAtom.length}</label>
                <input type={"button"} onClick={onClickAddHandler} value={'+'}/>
                <input type={"button"} onClick={onClickSubHandler} value={'-'}/>
                <div style={{display: "block"}}>
                {
                    readListAtom.map((item, index) => (
                        <div key={index} style={{width:30, height:30,margin:"0 5px", backgroundColor:'blue', display: "inline-block"}} >
                        </div>
                    ))
                }
                </div>
            </div>
        </div>
    )

}