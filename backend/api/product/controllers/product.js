const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Retrieve a record.
   *
   * @return {Object}
   */

  async findOne(ctx) {
    const { slug } = ctx.params;

    const entity = await strapi.services.product.findOne({ slug });
    // console.log(entity.category)
    let currentCategory = entity.category
    let categoryList = [currentCategory]
    while(currentCategory.parent != null){
      if(typeof(currentCategory.parent) == 'object'){
        currentCategory = currentCategory.parent
      }else{
        if(typeof(currentCategory.parent) == 'number'){
          currentCategory = await strapi.services.category.findOne({ id: currentCategory.parent})
        }
      }
      categoryList.unshift(currentCategory)
    }
    entity.parents = categoryList
    return sanitizeEntity(entity, { model: strapi.models.product });
  },
};
