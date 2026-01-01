import { useState } from "react";
import MensPage from "../Pages/MensPage";
import WomensPage from "../Pages/WomensPage";

const ToggleContent = () => {
  const [active, setActive] = useState("women");

  return (
    <div >
     <ul className="flex lg:gap-10 gap-4 items-center ">
      <li className="hidden lg:inline">
      <div className="relative w-64 h-12 bg-gray-200 rounded-full flex items-center p-4">
       
        <div
          className={`absolute top-1  h-10 w-1/2 bg-white rounded-full shadow-md transition-transform duration-300 ease-in-out
          ${active === "men" ? "translate-x-full" : "translate-x-0"}`}
        />

        
        <button
          onClick={() => setActive("women")}
          className={`z-10 w-1/2 h-full text-sm font-semibold transition-colors
          ${active === "women" ? "text-black" : "text-gray-500"}`}
        >
          Women
        </button>

       
        <button
          onClick={() => setActive("men")}
          className={`z-10 w-1/2 h-full text-sm font-semibold transition-colors
          ${active === "men" ? "text-black" : "text-gray-500"}`}
        >
          Men
        </button>
      </div>
</li>
<li className=" text-2xl hidden lg:inline">Winter Wear</li>
<li className=" text-2xl hidden lg:inline">Shop Now</li>
<li className=" text-2xl hidden lg:inline">Official Merch</li>

 <li  className="flex flex-col ml-2 lg:hidden">
  <div className="w-15 h-15 flex  items-center justify-center bg-gray-200 rounded-2xl  ">
  <i
    className="fa-regular fa-snowflake text-4xl"
    style={{ color: "#111212" }}
  ></i>
  </div>
   <p className="text-[10px] ">Winter Wear</p>
</li>

<li className="flex flex-col lg:hidden">
  <div className="w-15 h-15 flex  items-center justify-center bg-gray-200 rounded-2xl  ">
 <i className="fa-solid fa-cart-plus text-3xl" style={{color: "#1e1e1f"}}></i>
  </div>
   <p className="text-[10px] "> Shop Now</p>

</li>

   </ul>
     
      <div className="mt-6 w-[calc(100vw-20)] ">
        {active === "men" ? <MensPage /> : <WomensPage />}
      </div>

    </div>
  );
};

export default ToggleContent;
