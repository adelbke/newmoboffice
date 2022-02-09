const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Retrieve a record.
   *
   * @return {Object}
   */


  async findOne(ctx) {
    const { slug } = ctx.params;
    
    const entity = await strapi.services.category.findOne({ slug:slug });

    let children = await strapi.services.category.find({ parent: entity.id })
    entity.children = children
    return sanitizeEntity(entity, { model: strapi.models.category });
  }
};
