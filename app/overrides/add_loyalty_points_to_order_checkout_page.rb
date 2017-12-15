Deface::Override.new(virtual_path: 'spree/shared/_order_details',
  name: 'add_loyalty_points_to_order_checkout_page',
  insert_after: "#order-charges",
  text: "
    <% if spree_current_user %>
      <tfoot id='loyalty_points'>
        <tr id='loyalty-points-row'>
          <% if @order.loyalty_points_awarded? %>
            <td></td>
            <td colspan='4' class='total'><span><%= @order.loyalty_points_for(@order.item_total) %></span> <b><%= Spree.t(:loyalty_points) %> have been credited to your account.</b></td>
          <% else %>
            <td></td>
            <td colspan='4' class='total'><span><%= @order.loyalty_points_for(@order.item_total) %></span> <b><%= Spree.t(:loyalty_points) %> will be credited to your account  soon.</b></td>
          <% end %>
        </tr>
      </tfoot>
    <% else %>
      <tfoot id='loyalty_points'>
        <tr id='loyalty-points-row'>
          <td></td>
          <td colspan='4' class='total'><b><%= link_to 'Sign up now', spree.signup_path %></b> to receive Mini Points from purchases!</td>
        </tr>
      </tfoot>
    <% end %>
  ")
