---
name: batch-job-durability
description: >
  Runs long multi-worker batch jobs so a host restart or a per-item failure cannot silently destroy the results.
license: MIT
---

# Durable Batch Jobs

## Plan the parallel work

- Measure one unit's cost on the real host before launching the fleet.

  Time a single item end to end, then size the worker count from host capacity instead of guessing.

- Give each worker its own output file named by worker id.

  Merge the files only after every worker has joined.

- Never let parallel workers write to one shared file, even behind a lock.

  Contended appends and overwrites lose rows silently.

- Run the heavy work on the durable host and start it so it survives your own VM restart.

  Orchestrate from your VM and never execute the long loop from it.

## Write checkpoints that survive restarts

- Write each checkpoint to a temp file in the same directory, flush and fsync it, then rename it over the target.

  A mid-write restart zeroes a direct write but leaves the previously renamed file intact.

- Back up job inputs and checkpoints to the durable host before starting the job.

  A backup made after the failure is not a backup.

## Fail loudly and validate before done

- Never wrap the real work in a bare except that passes.

  Record the failing item id and the error, then decide whether to continue or stop.

- Never store an empty or structure-only result row as if the work happened.

  An empty row poisons every aggregate computed from the file.

- Validate before marking the job complete.

  Count the result rows against the input count, reject empty values, and investigate a stall instead of reporting success.


## Alternatives for better results

- For short jobs on a stable host, a single checkpoint file with atomic renames is enough.

  Per-worker files pay off when workers run in parallel or the host can restart mid-job.