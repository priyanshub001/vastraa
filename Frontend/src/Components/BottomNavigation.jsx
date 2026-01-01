import React from 'react'

const BottomNavigation = () => {
  return (
    <>
    
<div className='w-full bg-gray-500  h-18  shadow-sm rounded  ' >
    
   <ul className='flex gap-4 px-5 justify-between '>

    <li className='flex flex-col items-center justify-center '>
         
        <div  className='h-10 w-10 flex justify-center items-center bg-gray-300 rounded-full mt-2'>
            <i class="fa-solid fa-fan" style={{color: "#0d0d0d"}}></i>
        </div>
        
        
        <p className='text-[15px]'> Categories</p></li>



  <li className='flex flex-col items-center justify-center'>
    <div className='h-10 w-10 flex justify-center items-center bg-gray-300 rounded-full mt-2'>
        <i class="fa-regular fa-user " style={{color:" #111212"}}></i>
    </div>
   <p className='text-[15px]'> Profile</p>
</li>
   </ul>
     
     </div>
   
    
    </>
  )
}

export default BottomNavigation