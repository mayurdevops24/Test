from loguru import logger

# Basic logs
logger.debug("This is a DEBUG message")
logger.info("This is an INFO message")
logger.warning("This is a WARNING message")
logger.error("This is an ERROR message")
logger.success("This is a SUCCESS message")

# Save logs to a file
logger.add("action_log.log", rotation="500 KB")
logger.info("Log saved to file with rotation enabled")
