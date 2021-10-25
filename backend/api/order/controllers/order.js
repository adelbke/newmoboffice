'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-controllers)
 * to customize this controller
 */

// module.exports = {};


const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Create a record.
   *
   * @return {Object}
   */

  async create(ctx) {
    // retrieving the id of the current user
    let { id, username } = ctx.state.user
    
    // setting the current user's id as the client of the order
    let requestBody = ctx.request.body
    requestBody.client = id

    // // generate an order number and append it to the order
    // let orderNumber =  `${new Date().getTime()}_${id}_${username}`

    // return orderNumber

    // create an entity from the data in request body
    let entity = await strapi.services.order.create(requestBody)

    // return a stanitized output of the created entity
    return sanitizeEntity(entity, {model: strapi.models.order})
  },

  async find(ctx){
      let { id, role } = ctx.state.user

      let orders;

      if (["Client","retailer client"].includes(role.name) || role.id == 1){
        orders = await strapi.services.order.find({client: id});
      }
      else{
        orders = await strapi.services.order.find();
      }
      return orders.map(order => sanitizeEntity(order, {model: strapi.models.order }))
  }
};
