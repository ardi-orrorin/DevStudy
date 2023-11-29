export default function Temp({index, data, onChange}) {
    return (
        <div key={index}>
            <span>{data.id}&nbsp;</span>
            <span>{data.userId}&nbsp;</span>
            <div>
              <div>
                <div>
                  {data.title}
                </div>
                <div>
                  <input type="text" name='title' value={data.title} style={{width:'100%'}} onChange={(e)=> onChange(e, index)} />
                </div>
              </div>
              <div>
                <div>
                  {data.title}
                </div>
                <div>
                  <input type="text" name='body' value={data.body} style={{width:'100%'}} onChange={(e)=> onChange(e, index)} />
                </div>
              </div>
            </div>
          </div>
    )
}