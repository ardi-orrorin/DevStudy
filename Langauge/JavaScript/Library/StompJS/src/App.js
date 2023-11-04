import * as StompJS from "@stomp/stompjs"
import { useEffect, useRef } from "react";
import { Toaster, toast } from "react-hot-toast";
import CM from "./CM";
// import { ToastContainer, toast } from "react-toastify";
// import 'react-toastify/dist/ReactToastify.css';

function  App() {
  const client = useRef();
  
  let data;  

  useEffect(()=>{
    client.current = new StompJS.Client({
      brokerURL: 'ws://localhost:9091/ws',
      connectHeaders:{
        Authorization: 'test'
      },
      debug: str => {
        console.log(str);
      },
      onConnect,
      onDisconnect: ()=>{
        client.current.deactivate();    
      }
    })
    client.current.activate()
  },[data])
  

  function onConnect(){
    client.current.subscribe(
      '/sub/chat/101', message =>{
        data = JSON.parse(message.body) 
        console.log(data);
        toast.custom((t) => (
          <CM profile={'/favicon.ico'}
              message={data.message}
              createDate={'2023-10-20'}
              onClick={()=>{
                console.log(data.sender);
                toast.remove(t.id);
              }} />
        ),{duration: 10*1000})
      })
  }

  return (
    <>
      <Toaster position="top-right" reverseOrder={true} />
      <CM profile={'/favicon.ico'}
              message={'sdfsdfdsfd'}
              createDate={'2023-10-20'}
              />
    </>
    
  );
}

export default App;
