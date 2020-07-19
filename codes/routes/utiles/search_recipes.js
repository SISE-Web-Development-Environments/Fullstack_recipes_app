const axios = require("axios"); // supporets promises
const recipes_api_url = "https://api.spoonacular.com/recipes";
const api_key = process.env.spooncular_apiKey;

function extractQueriesParams(query_params, search_params) {
  const params_list = ["diet", "cuisine", "intolerance"];
  params_list.forEach((param) => {
    if (query_params[param]) {
      // if query_params contains one of each params
      search_params[param] = query_params[param]; //add to serch_params
    }
  });
  console.log(search_params);
}

//#region search
async function searchForRescipes(search_params) {
  let search_response = await axios.get(
    `${recipes_api_url}/search?apiKey=${api_key}`,
    {
      params: search_params,
    }
  );
  const recipes_id_list = extractSearchResultsdIds(search_response);
  console.log(recipes_id_list);
  // Get recipes info by their ids
  let info_array = await getRecipesPreview_And_Instructions_Info(
    recipes_id_list,
    search_params
  );
  console.log("Info_array: ", info_array);

  return info_array;
}

// return ids list containing the id of each recipe
function extractSearchResultsdIds(search_response) {
  let recipes = search_response.data.results;
  recipes_id_list = [];
  recipes.map((recipe) => {
    console.log(recipe.title);
    recipes_id_list.push(recipe.id);
  });
  return recipes_id_list;
}

//get the preview recipe information + instructions
async function getRecipesPreview_And_Instructions_Info(
  recipes_id_list /*,search_params*/
) {
  let promises = [];

  //run on each id in ids list and push to promises array the promise that return from get response
  recipes_id_list.map(
    (id) =>
      promises.push(
        axios.get(`${recipes_api_url}/${id}/information?apiKey=${api_key}`)
      ) // each promise that we push to promises arrays is get request that contains the information about each recipe
  );
  //waiting for all promises to finsh. info_responsel contains all value's promises
  let info_responsel = await Promise.all(promises);

  relevantRecipesData = extractRecipes_Preview_Instructions(info_responsel);

  return relevantRecipesData;
}

function extractRecipes_Preview_Instructions(recipes_info) {
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
      servings,
      // instructions,
      analyzedInstructions,
    } = recipes_info.data;
    let instructions = extractInstructions(analyzedInstructions);

    return {
      id: id,
      title: title,
      readyInMinute: readyInMinutes,
      aggregateLikes: aggregateLikes,
      vegetarian: vegetarian,
      vegan: vegan,
      glutenFree: glutenFree,
      image: image,
      servings: servings,
      instructions: instructions,
    };
  });
}
//#endregion

//#region personal
async function searchForPersonalRecipes(all_user_recipe_info_list) {
  let info_array = await getPersonalRecipesInfo(all_user_recipe_info_list);
  console.log("Info_array: ", info_array);

  return info_array;
}

async function getPersonalRecipesInfo(all_user_recipe_info_list) {
  let promises = [];

  //run on each id in ids list and push to promises array the promise that return from get response
  all_user_recipe_info_list.map((row) => {
    console.log(row);
    //console.log(JSON.stringify(row));
    promises.push(row); // each promise that we push to promises arrays is get request that contains the information about each recipe
  });
  //waiting for all promises to finsh. info_responsel contains all value's promises
  let info_responsel = await Promise.all(promises);

  relevantRecipesData = extractPreview_PersonalRecipes(info_responsel);

  return relevantRecipesData;
}

function extractPreview_PersonalRecipes(recipes_info) {
  //
  return recipes_info.map((recipes_info) => {
    const {
      recipe_id,
      title,
      image,
      readyInMinutes,
      aggregateLikes,
      vegetarian,
      vegan,
      glutenFree,
      ingredientDescriptionAndAmount,
      instructions,
      servings,
    } = recipes_info;
    return {
      id: recipe_id,
      title: title,
      image: image,
      readyInMinute: readyInMinutes,
      aggregateLikes: aggregateLikes,
      vegetarian: vegetarian,
      vegan: vegan,
      glutenFree: glutenFree,
      ingredients: ingredientDescriptionAndAmount,
      instructions: instructions,
      servings: servings,
    };
  });
}
//#endregion

//#region family.

async function searchForfamilyRecipes(all_user_recipe_info_list) {
  let info_array = await getfamilyRecipesInfo(all_user_recipe_info_list);
  console.log("Info_array: ", info_array);

  return info_array;
}
async function getfamilyRecipesInfo(all_user_recipe_info_list) {
  let promises = [];
  //run on each id in ids list and push to promises array the promise that return from get response
  all_user_recipe_info_list.map((row) => {
    promises.push(row); // each promise that we push to promises arrays is get request that contains the information about each recipe
  });
  //waiting for all promises to finsh. info_responsel contains all value's promises
  let info_responsel = await Promise.all(promises);
  relevantRecipesData = extractPreview_familyRecipes(info_responsel);
  return relevantRecipesData;
}
function extractPreview_familyRecipes(recipes_info) {
  //
  return recipes_info.map((recipes_info) => {
    const {
      recipe_id,
      title,
      recipe_owner,
      traditional_preparation_time,
      image,
      readyInMinutes,
      aggregateLikes,
      vegetarian,
      vegan,
      glutenFree,
      ingredientDescriptionAndAmount,
      instructions,
      servings,
    } = recipes_info;
    return {
      id: recipe_id,
      title: title,
      recipeOwner: recipe_owner,
      traditionalPreparationTime: traditional_preparation_time,
      image: image,
      readyInMinute: readyInMinutes,
      aggregateLikes: aggregateLikes,
      vegetarian: vegetarian,
      vegan: vegan,
      glutenFree: glutenFree,
      ingredients: ingredientDescriptionAndAmount,
      instructions: instructions,
      servings: servings,
    };
  });
}
//#endregion

//#region favorite / only preview
async function searchForRescipes_onlyPreview(row) {
  let info_array = await getRecipesPreviewInfo(row);
  console.log("Info_array: ", info_array);

  return info_array;
}

//get the preview recipe information
async function getRecipesPreviewInfo(row /*,search_params*/) {
  let promises = [];

  //run on each id in ids list and push to promises array the promise that return from get response
  row.map(
    (id) =>
      promises.push(
        axios.get(
          `${recipes_api_url}/${id.recipe_id}/information?apiKey=${api_key}`
        )
      ) // each promise that we push to promises arrays is get request that contains the information about each recipe
  );
  //waiting for all promises to finsh. info_responsel contains all value's promises
  let info_responsel = await Promise.all(promises);

  relevantRecipesData = extractPreviewRecipesData(info_responsel);

  return relevantRecipesData;
}

// return only the preview data from all data in recipes_info
function extractPreviewRecipesData(recipes_info) {
  return recipes_info.map((recipes_info) => {
    //
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
    return {
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
//#endregion

//#region - get info on specific id recipe
async function searchForSpecificRescipe(search_params) {
  let search_response = await axios.get(
    `${recipes_api_url}/${search_params.recipeID}/information?apiKey=${api_key}`
  );
  const search_response_after_extract_relevantData = extractRecipes_All_information(
    search_response
  );

  return search_response_after_extract_relevantData;
}
// return all relevant information
function extractRecipes_All_information(recipes_info) {
  const {
    id,
    title,
    readyInMinutes,
    aggregateLikes,
    vegetarian,
    vegan,
    glutenFree,
    image,
    servings,
    extendedIngredients,
    analyzedInstructions,
  } = recipes_info.data;

  //  let instructions = ;
  let ingredients = extractRelevantIngredients(extendedIngredients);

  let instructions = extractInstructions(analyzedInstructions);
  return {
    id: id,
    title: title,
    readyInMinute: readyInMinutes,
    aggregateLikes: aggregateLikes,
    vegetarian: vegetarian,
    vegan: vegan,
    glutenFree: glutenFree,
    image: image,
    servings: servings,
    instructions: instructions,
    extendedIngredients: ingredients,
  };
}

function extractRelevantIngredients(extendedIngredients) {
  relenvantIngridient = [];
  for (let i = 0; i < extendedIngredients.length; i++) {
    relenvantIngridient.push(
      extendedIngredients[i].amount +
        " " +
        extendedIngredients[i].unit +
        " of " +
        extendedIngredients[i].name
    );
  }
  return relenvantIngridient;
}

function extractInstructions(analyzedInstructions) {
  let newInstructions = [];
  // let stepNum = 1;
  if (analyzedInstructions[0] != undefined) {
    const x = analyzedInstructions[0].steps.length;
    const y = analyzedInstructions[0].steps;
    for (let i = 0; i < x; i++) {
      newInstructions.push(
        // stepNum +
        // ". " +
        analyzedInstructions[0].steps[i].step
      );
      // stepNum++;
    }
  }
  return newInstructions;
}
//#endregion

//#region random
// 3 random recipes
async function randomRecipes() {
  let random_response = await axios.get(
    `${recipes_api_url}/random?apiKey=${api_key}&number=3&instructionsRequired=true`
  );
  for (let i = 0; i < 3; i++) {
    if (
      random_response.data.recipes[i].analyzedInstructions[0].steps.length ==
        0 ||
      random_response.data.recipes[i].image === undefined
    ) {
      random_response == undefined;
      random_response = await axios.get(
        `${recipes_api_url}/random?apiKey=${api_key}&number=3&instructionsRequired=true`
      );
      i == 0;
    }
  }
  let info_array = extractRandomRecipesData(random_response);

  return info_array;
}

function extractRandomRecipesData(recipes_info) {
  let recipesArray = recipes_info.data.recipes;
  return recipesArray.map((recipes_info) => {
    const {
      id,
      title,
      readyInMinutes,
      aggregateLikes,
      vegetarian,
      vegan,
      glutenFree,
      image,
    } = recipes_info;
    return {
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
//#endregion

//#region - exports
exports.searchForRescipes = searchForRescipes; //export searchForRescipes function
exports.extractQueriesParams = extractQueriesParams; // export extractQueriesParams function
exports.getRecipesPreviewInfo = getRecipesPreviewInfo;
exports.searchForRescipes_onlyPreview = searchForRescipes_onlyPreview;
exports.searchForPersonalRecipes = searchForPersonalRecipes;
exports.searchForfamilyRecipes = searchForfamilyRecipes;
exports.searchForSpecificRescipe = searchForSpecificRescipe;
exports.randomRecipes = randomRecipes;
//#endregion
