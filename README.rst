
Track processed batches and events in target DB
================================================

Batch tracking is OK.

Event tracking is OK if consumer does not use retry queue.

Batch tracking
--------------

is_batch_done(consumer, batch)

returns:

  true - batch is done already
  false - batch is not done yet

set_batch_done(consumer, batch)

returns:

  true - tagging successful, batch was not done yet
  false - batch was done already

Event tracking
--------------

is_batch_done(consumer, batch, event)

returns:

  true - event is done
  false - event is not done yet


set_batch_done(consumer, batch, event)

returns:

  true - tagging was successful, event was not done
  false - event is done already


