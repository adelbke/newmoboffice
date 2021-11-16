const { sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Retrieve a record.
   *
   * @return {Object}
   */

  async findOne(ctx) {
    console.log(ctx.params)
    const { slug } = ctx.params;

    const entity = await strapi.services.category.findOne({ slug:slug });
    return sanitizeEntity(entity, { model: strapi.models.category });
  }
};
