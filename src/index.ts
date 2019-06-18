export const main = async () => {
  process.title = 'Node Template';
  console.log('hello world!');
};

export const run = async () => {
  try {
    await main();
    process.exit();
  } catch (error) {
    console.error(error.message || error);
    process.exit(1);
  }
};

if (require.main === module) run();
