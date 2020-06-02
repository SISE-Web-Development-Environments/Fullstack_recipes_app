const axios = require("axios"); // supporets promises
const recipes_api_url = "https://api.spoonacular.com/recipes";
// api_key --> should be in .env file !
const api_key = "apiKey=aa9b67606b0d49abaf60ca06857f1c25"

function extractQueriesParams(query_params,search_params){
    const params_list = ["diet","cuisine", "intolerance"]; //אנחנו רצים על הרשימה הזו ולא על הרשימה שחוזרת מהשרת כי אנחנו לא יכולים לסמוך על המשתמש, יכול להיות שהוא שלח פרמטרים שלא רלוונטיים לשאליתא
    params_list.forEach((param)=> {
        if(query_params[param]){ // אם  אחד מהפרמטרים האלה קיים ב query_params 
            search_params[param] = query_params[param]; // אז נוסיף את זה ל serch_params 
        }
    });
    console.log(search_params);
}

async function searchForRescipes(search_params){
    let search_response = await axios.get(`${recipes_api_url}/search?${api_key}`, 
        {
          params: search_params,    
        }
    );
    const recipes_id_list = extractSearchResultsdIds(search_response);
    console.log(recipes_id_list);
    // Get recipes info by their ids
    let info_array = await getResipesInfo(recipes_id_list, search_params);
    console.log("Info_array: ", info_array);
    
    return info_array;
}

async function getResipesInfo(recipes_id_list/*,search_params*/){
   let promises= [];

   //run on each id in ids list and push to promises array the promise that return from get response 
    recipes_id_list.map((id) => 
        promises.push(axios.get(`${recipes_api_url}/${id}/information?${api_key}`)) // each promise that we push to promises arrays is get request that contains the information about each recipe
    );
    //waiting for all promises to finsh. info_responsel contains all value's promises
    let info_responsel = await Promise.all(promises); 
    //let IdAndInstructionsList = extractIdAndInstructions(info_responsel);
    // let isInstructions = checkInstructionsExist(IdAndInstructionsList);
    // if(!isInstructions){
    //     searchForRescipes(search_params);
    // }else{
        relevantRecipesData = extractRelevatRecipesData(info_responsel);
        return relevantRecipesData;
    // }
}

// function extractIdAndInstructions(recipes_info){
//     return recipes_info.map((recipes_info)=>{
//         const{
//             id,
//             instructions,
//         } = recipes_info.data
//         return{
//             id: id,
//             instructions: instructions,    
//         };
//     });
// }

// function checkInstructionsExist(IdAndInstructionsList){
//     IdAndInstructionsList.forEach((param)=> {
//         console.log(param);
//         if( IdAndInstructionsList[param].instructions != ""){
//             return true;
//         }
//         return false;  
//     });
// }

// return only the relvant data from all data in recipes_info 
function extractRelevatRecipesData(recipes_info){
     return recipes_info.map((recipes_info) => {
         const {
             id,
             title,
             readyInMinutes,
             aggregateLikes,
             vegetarian,
             vegan,
             glutenFree,
             image,
         } = recipes_info.data;
         return{
             id: id,
             title: title,
             readyInMinute: readyInMinutes,
             aggregateLikes: aggregateLikes,
             vegetarian: vegetarian,
             vegan: vegan,
             glutenFree: glutenFree,
             image: image,   
         };
    });
}

// return ids list containing the id of each recipe
function extractSearchResultsdIds(search_response){
    let recipes = search_response.data.results;
    recipes_id_list=[];
    recipes.map((recipe)=>{ 
        console.log(recipe.title);
        recipes_id_list.push(recipe.id);
    });
    return recipes_id_list;
}

exports.searchForRescipes = searchForRescipes; //export searchForRescipes function
exports.extractQueriesParams = extractQueriesParams; // export extractQueriesParams function