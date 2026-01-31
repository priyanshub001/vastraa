import axios from 'axios';
import React, { useEffect,useState } from 'react'
import default_profile from '../assets/default_profile.jpeg'
import { useNavigate } from 'react-router-dom';

const UserProfile = () => {

  const [user,setUser]=useState({"Username":"","Email":"","Age":""});
 const Token=localStorage.getItem("Token");
 const navigator=useNavigate();
  useEffect(()=>{
  

    axios.get("http://127.0.0.1:5000/api/users/Profile",{headers:{Authorization:`Bearer ${Token}`}})
    .then(res=>{setUser(res.data.data)})
    .catch(error=>{console.log(error.response.data.error)});
  },[]);


  const Logout=()=>{

    localStorage.removeItem("Token");
    localStorage.removeItem("Role");
    navigator("/")


  }
  return (
   <>
   
   <div className='flex justify-center items-center flex-col'>


     <div className=''><img src={default_profile} alt="" className='rounded-full h-30 w-30'/>
     
     <p className=''>Username : {user.Username}</p>
    <p>Email : {user.Email}</p>
    <p>Age :   {user.Age}</p>
    <button type="button" className=' rounded px-4 bg-red-600 text-white' onClick={Logout}> Logout</button>
     </div>
     
   
    
   </div>
   
   
   
   
   
   </>
  )
}

export default UserProfile