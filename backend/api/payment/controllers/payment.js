'use strict';

/**
 * A set of functions called "actions" for `payment`
 */

module.exports = {

  getGateways: async (ctx, next) => {
    try {
      ctx.body = 'ok';
    } catch (err) {
      ctx.body = err;
    }

    return "Hello world";
  }


  // exampleAction: async (ctx, next) => {
  //   try {
  //     ctx.body = 'ok';
  //   } catch (err) {
  //     ctx.body = err;
  //   }
  // }
};
