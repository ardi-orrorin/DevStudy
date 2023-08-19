import { useRef } from "react";
import * as StompJS from "@stomp/stompjs"

function App() {

  const client = useRef();

  client.current = new StompJS.Client({
    brokerURL: 'ws://localhost:9091/ws',
    connectHeaders:{
      Authorization: 'test'
    },
    debug: str => {
      console.log(str);
    },
    onConnect: ()=>{
        client.current.subscribe(
          '/sub/chat/101', message =>{
            console.log(message.body);
        });
        client.current.subscribe(
          '/sub/chat/102', message =>{
            console.log(message.body);
        });
    }
  })
  client.current.activate();




  return (
    <>
    </>
    
  );
}

export default App;
