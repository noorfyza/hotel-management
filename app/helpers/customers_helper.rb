module CustomersHelper
  def checkin_record(customer)
    checkin_record = Checkin.where(customer_id: customer.id)
    if checkin_record.present?
      if checkin_record.collect(&:checked_in).last.eql?(true)
        false
      else
        true
      end
    else
      true
    end
  end
end
