import { useEffect, useState } from 'react';
export default function Post() {
    const [data, setData] = useState(null);

    useEffect(() => {
        setTimeout(() => {
            fetch('https://jsonplaceholder.typicode.com/posts')
            .then(response => response.json())
        .then(json => setData(json));
        }, 3000);
    },[]);

    if (!data) {
        return <div>Loading... List</div>
    }

    return (
        <>
            {
                data && data.map((item, index) => {
                    console.log(item);
                    return (
                        <div key={index}>
                            <h2>{item.title}</h2>
                            <p>{item.body}</p>
                        </div>
                    )
                })
            }
        </>
    )
}