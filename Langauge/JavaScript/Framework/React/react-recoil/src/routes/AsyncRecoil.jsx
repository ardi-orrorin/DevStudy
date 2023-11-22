import axios from "axios";
import {atom, selector, useRecoilValue, useSetRecoilState} from "recoil";


async function api()  {
    const url = 'https://jsonplaceholder.typicode.co/posts'

    const data = await axios.get(url)
        .then(res => res.data)
        .catch(err => {
            throw {code:1000, message: err}
        })

    return data;
}


const sampleData = atom({
    key: 'sampledata',
    default: []
})


const asyncData = selector({
    key: 'asyncdata',
    get: async ({get}) => {
        const data = await api();
        return data;
    }
})


export default function AsyncRecoil() {

    // const [data, setData] = useRecoilState(sampleData)
    const data = useRecoilValue(asyncData)

    // useEffect( () => {
        // api().then(data => {
        //     setData(data)
        //     console.log(data)
        // })
    // },[])

    // if(data.length < 1) return <div>loading...</div>

    return (
        <div>
            {
                data.map((item, index) => (
                    <Item key={index} index={index} id={item.id} userId={item.userId} title={item.title} />
                ))
            }
        </div>
    )
}

function Item({index, id, userId, title}) {
    const setData = useSetRecoilState(sampleData)

    function onchangeHandler(e) {
        setData((prev) => {
            const cur = [...prev];
            cur[index] = {...cur[index], title: e.target.value}
            return cur;
        })
    }

    return (
        <div>
            <div>
                {id} &nbsp;
                {userId} &nbsp;
                {title}
            </div>
            <div>
                <input type="text" onChange={onchangeHandler} value={title} />
            </div>
        </div>
    )
}