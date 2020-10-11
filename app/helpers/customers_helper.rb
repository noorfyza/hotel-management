module CustomersHelper
  def checkin_record(customer)
    checkin_record = Checkin.where(customer_id: customer.id)
    if checkin_record.present?
      checkin_record.collect(&:checked_in).include?(false)
    else
      true
    end
  end
end
